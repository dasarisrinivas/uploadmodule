SELECT FLD_NM,FLD_VALUE FROM mstr_lang_flds,customer WHERE PAGE__CD = 'AUTH_LOGIN' AND mstr_lang_flds.EXPIRY_DT IS NULL and customer.id='1' and customer.lang_pref__ID=mstr_lang_flds.MSL__ID