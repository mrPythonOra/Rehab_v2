set serveroutput on
declare
l_char varchar2(100);
FUNCTION get_unistr_arg (
    p_code_point IN VARCHAR2
) RETURN VARCHAR2 IS
    v_clean_hex VARCHAR2(20);
    v_dec_val   NUMBER;
    v_high      NUMBER;
    v_low       NUMBER;
BEGIN
    -- Очищуємо рядок від префіксів 'U+' або 'u+' та пробілів
    v_clean_hex := UPPER(TRIM(p_code_point));
    IF v_clean_hex LIKE 'U+%' THEN
        v_clean_hex := SUBSTR(v_clean_hex, 3);
    ELSIF v_clean_hex LIKE 'U%' THEN
        v_clean_hex := SUBSTR(v_clean_hex, 2);
    END IF;

    -- Конвертуємо шістнадцятковий код у число
    v_dec_val := TO_NUMBER(v_clean_hex, 'XXXXXXXX');

    -- Якщо символ у межах Багатомовної Площини (BMP <= U+FFFF)
    IF v_dec_val <= 65535 THEN
        RETURN '\' || LPAD(TO_CHAR(v_dec_val, 'FMXXXX'), 4, '0');
    ELSE
        -- Для символів поза BMP обчислюємо UTF-16 сурогатну пару
        v_dec_val := v_dec_val - 65536;
        v_high := 55296 + FLOOR(v_dec_val / 1024); -- Високий сурогат (0xD800)
        v_low  := 56320 + MOD(v_dec_val, 1024);     -- Низький сурогат (0xDC00)
        
        RETURN '\' || TO_CHAR(v_high, 'FMXXXX') || '\' || TO_CHAR(v_low, 'FMXXXX');
    END IF;
END get_unistr_arg;
begin
  l_char := 'U+1F5C4';
  dbms_output.put_line(l_char||': '||get_unistr_arg(l_char));
end;
/