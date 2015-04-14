# ipa-389-access

prefix= [%-:string-to:] %] conn=%conn:number% op=%op:number%

# [09/Apr/2015:11:33:33 +0200] conn=27 op=3 BIND dn="" method=sasl version=3 mech=GSSAPI
rule=ipa-389-access,bind: BIND dn=%dn:quoted-string% method=%method:word% version=%version:number% mech=%mech:word%

prefix= [%-:string-to:] %] conn=%conn:number% op=%op:number% RESULT err=%err:number% tag=%app-tag:number% nentries=%nentries:number%

# [09/Apr/2015:11:33:34 +0200] conn=28 op=3 RESULT err=0 tag=97 nentries=0 etime=0 dn="fqdn=centos-7-vm.kvm,cn=computers,cn=accounts,dc=kvm"
rule=ipa-389-access,result: etime=%etime:number% dn=%dn:quoted-string%

# [09/Apr/2015:11:33:33 +0200] conn=27 op=2 RESULT err=14 tag=97 nentries=0 etime=0, SASL bind in progress
rule=ipa-389-access,result: etime=%etime:number%, %msg:rest%

# [09/Apr/2015:11:33:34 +0200] conn=28 op=4 RESULT err=0 tag=101 nentries=0 etime=0 notes=P
rule=ipa-389-access,result: etime=%etime:number% notes=%notes:word%

# [09/Apr/2015:11:33:33 +0200] conn=4 op=69 RESULT err=0 tag=101 nentries=1 etime=0
rule=ipa-389-access,result: etime=%etime:number%

