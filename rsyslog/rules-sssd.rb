# sssd-*

prefix= (%-:string-to:) %)

# (Wed Apr 15 15:54:46 2015) [[sssd[ldap_child[4292]]]] [ldap_child_get_tgt_sync] (0x0100): Using keytab [MEMORY:/etc/krb5.keytab]
rule=sssd: [[sssd[%component:char-to:[%[%component-pid:number%]]]] [%action:string-to:] %] (0x%log-level:interpret:base16int:string-to:)\x3a %): %msg:rest%

# (Wed Apr 15 10:10:31 2015) [sssd[be[linux.test]]] [ipa_s2n_exop_send] (0x0400): Executing extended operation
rule=sssd: [sssd[%component:char-to:[%[%domain:string-to:]]] %]]] [%action:string-to:] %] (0x%log-level:interpret:base16int:string-to:)\x3a %): %msg:rest%

# (Wed Apr 15 16:01:02 2015) [sssd[nss]] [sss_cmd_get_version] (0x0200): Offered version [1].
rule=sssd: [sssd[%component:string-to:]] %]] [%action:string-to:] %] (0x%log-level:interpret:base16int:string-to:)\x3a %): %msg:rest%

# (Wed Apr 15 15:54:53 2015) [sssd] [service_send_ping] (0x0100): Pinging pam
rule=sssd: [sssd] [%action:string-to:] %] (0x%log-level:interpret:base16int:string-to:)\x3a %): %msg:rest%

