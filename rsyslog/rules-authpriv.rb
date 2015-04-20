# authpriv

# pam_sss(su:auth): received for user admin: 17 (Failure setting user credentials)

prefix= pam_sss(%service:char-to:\x3a%:auth): %-:string-to: user% user %username:string-to:\x3a %:

rule=authpriv,pam_sss,auth,status_code_0: 0 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_4: 4 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_6: 6 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_13: 13 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_7: 7 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_17: 17 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_22: 22 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_12: 12 (%msg:char-to:)%)
rule=authpriv,pam_sss,auth,status_code_16: 16 (%msg:char-to:)%)


# pam_sss(su:account): received for user admin: 17 (Failure setting user credentials)

prefix= pam_sss(%service:char-to:\x3a%:account): %-:string-to: user% user %username:string-to:\x3a %:

rule=authpriv,pam_sss,account,status_code_0: 0 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_4: 4 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_6: 6 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_13: 13 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_7: 7 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_17: 17 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_22: 22 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_12: 12 (%msg:char-to:)%)
rule=authpriv,pam_sss,account,status_code_16: 16 (%msg:char-to:)%)


annotate=status_code_0:+status_code="0"
annotate=status_code_4:+status_code="4"
annotate=status_code_6:+status_code="6"
annotate=status_code_13:+status_code="13"
annotate=status_code_7:+status_code="7"
annotate=status_code_17:+status_code="17"
annotate=status_code_22:+status_code="22"
annotate=status_code_12:+status_code="12"
annotate=status_code_16:+status_code="16"


annotate=status_code_0:+status_text="Success"
annotate=status_code_4:+status_text="Internal SSSD Error"
annotate=status_code_6:+status_text="Access Denied"
annotate=status_code_13:+status_text="Access Denied"
annotate=status_code_7:+status_text="Authentication Failed"
annotate=status_code_17:+status_text="Authentication Failed"
annotate=status_code_22:+status_text="Password Change Failed"
annotate=status_code_12:+status_text="Password Change Required"
annotate=status_code_16:+status_text="Password Change Required"

