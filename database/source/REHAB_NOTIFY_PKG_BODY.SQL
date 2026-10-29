

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "REHAB_NOTIFY_PKG" AS

    procedure send_queue AS
        l_workspace_id NUMBER;
    BEGIN
        -- 1. Look up the Security Group ID for your workspace name
        l_workspace_id := apex_util.find_security_group_id (
            p_workspace => 'REHABILITATION' -- e.g., 'MY_WORKSPACE'
        );

        -- 2. Set the APEX session security group context
        apex_util.set_security_group_id (
            p_security_group_id => l_workspace_id
        );

        for i in (select * from REHAB_NOTIFICATION_QUEUE where NQ_STATUS = 'INQUEUE' and NQ_SEND_DT  - NUMTODSINTERVAL(2, 'MINUTE') < systimestamp
                 )
        loop
            -- 3. Now you can safely call your APEX PWA or utility functions
            apex_pwa.send_push_notification (
                p_application_id => 200,             -- Your Application ID
                p_user_name      => i.NQ_APP_USER,         -- Recipient username
                p_title          => i.NQ_TITLE,  -- Notification Title
                p_body           => i.NQ_BODY,
                p_target_url     => i.NQ_TARGET_URL
            );
            REHAB_LOGGING_PKG.logmsg($$PLSQL_UNIT, $$PLSQL_LINE,'Notification "%p" for user "%p" is sent',i.NQ_TITLE,i.NQ_APP_USER);
            update REHAB_NOTIFICATION_QUEUE set NQ_STATUS = 'ISSENT', NQ_SENT = systimestamp at time zone SESSIONTIMEZONE where NQ_ID = i.NQ_ID;
        end loop;
        COMMIT;
    END send_queue;

    procedure setup_queue_processing
    is
    begin
        DBMS_SCHEDULER.CREATE_JOB (
            job_name        => 'REHAB_NOTIFICATION_QUEUE_CHECK',
            job_type        => 'PLSQL_BLOCK',
            job_action      => 'BEGIN
                                   REHAB_NOTIFY_PKG.send_queue;
                                END;',
            start_date      => trunc(SYSDATE),
            repeat_interval => 'FREQ=MINUTELY; INTERVAL=1', -- Optional: runs daily
            enabled         => TRUE,
            comments        => 'Send notifications'
        );
    end;
END REHAB_NOTIFY_PKG;
/

