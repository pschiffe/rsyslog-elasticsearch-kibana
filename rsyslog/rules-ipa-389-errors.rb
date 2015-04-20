# ipa-389-errors

prefix= [%-:string-to:] %] NSMMReplicationPlugin - agmt=%agmt:quoted-string% (%dst-host:char-to:\x3a%:%dst-port:number%):

# [15/Mar/2015:10:10:45 +0100] NSMMReplicationPlugin - agmt="cn=meTocentos-7-vm.kvm" (centos-7-vm:389): Replication bind with GSSAPI auth failed: LDAP error -2 (Local error) (SASL(-1): generic failure: GSSAPI Error: Unspecified GSS failure.  Minor code may provide more information (Ticket not yet valid))
rule=NSMMReplicationPlugin,replication-status,error: Replication bind with %mech:word% auth failed: %msg:rest%

# [14/Apr/2015:16:34:37 +0200] NSMMReplicationPlugin - agmt="cn=meTocentos-7-vm.kvm" (centos-7-vm:389): Replication bind with GSSAPI auth resumed
rule=NSMMReplicationPlugin,replication-status,info: Replication bind with %mech:word% auth resumed

