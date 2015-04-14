# krb5-kdc

prefix= %-:date-rfc3164% %-:word% krb5kdc[%pid:number%](%app-severity:string-to:)\x3a %): AS_REQ (%-:string-to:}) %}) %src-addr:string-to:\x3a %:

# Apr 09 11:33:34 centos-7-vm krb5kdc[2120](info): AS_REQ (6 etypes {18 17 16 23 25 26}) 192.168.122.40: ISSUE: authtime 1428572014, etypes {rep=18 tkt=18 ses=18}, host/centos-7-vm.kvm@KVM for krbtgt/KVM@KVM
rule=krb5-kdc,as-req,kinit,issue: ISSUE: authtime %authtime:number%, etypes {%-:string-to:}, %}, %src:word% for %dst:word%

# Apr 13 17:42:26 centos-7-vm krb5kdc[2121](info): AS_REQ (6 etypes {18 17 16 23 25 26}) 192.168.122.40: PREAUTH_FAILED: admin@KVM for krbtgt/KVM@KVM, Decrypt integrity check failed
rule=krb5-kdc,as-req,kinit,preauth-failed: PREAUTH_FAILED: %user:word% for %dst:string-to:, %, %msg:rest%

