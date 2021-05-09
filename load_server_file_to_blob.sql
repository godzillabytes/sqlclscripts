DECLARE
    --v_blob         BLOB :=  EMPTY_BLOB();
    v_bfile        BFILE := bfilename('&1', '&2');
    v_dest_offset  INTEGER := 1;
    v_src_offset   INTEGER := 1;
BEGIN
    dbms_lob.createtemporary(:v_blob, true);
    dbms_lob.fileopen( v_bfile );
    dbms_lob.loadblobfromfile(dest_lob => :v_blob, src_bfile => v_bfile, amount => dbms_lob.lobmaxsize,
                             dest_offset => v_dest_offset,
                             src_offset => v_src_offset);
EXCEPTION
    WHEN OTHERS THEN
        :err_msg := sqlerrm;
END;
