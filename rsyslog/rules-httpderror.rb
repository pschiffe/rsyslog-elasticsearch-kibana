# IPA

prefix= [%-:string-to:] %] [:error] [pid %pid:number%] ipa: INFO:

# [Fri Feb 06 06:06:22.875298 2015] [:error] [pid 30769] ipa: INFO: [jsonserver_kerb] admin@RHEL.TEST: user_add(u'fbar', givenname=u'Foo', sn=u'Bar', cn=u'Foo Bar', displayname=u'Foo Bar', initials=u'FB', gecos=u'Foo Bar', krbprincipalname=u'fbar@RHEL.TEST', userpassword=u'********', random=False, noprivate=False, all=False, raw=False, version=u'2.112', no_members=False): SUCCESS
rule=ipa,ipa-call: [%-:string-to:] %] %principal:string-to:\x3a %: %action:char-to:(%(%parameters:string-to:)\x3a %): %status:word%

# [Wed Apr 08 16:07:37.772664 2015] [:error] [pid 2139] ipa: INFO: admin@KVM: batch: user_show(u'admin', no_members=True): SUCCESS
rule=ipa,ipa-call,batch: %principal:string-to:\x3a %: batch: %action:char-to:(%(%parameters:string-to:): %): %status:word%

# [Wed Apr 08 16:56:29.257898 2015] [:error] [pid 2139] ipa: INFO: admin@KVM: batch: dns_is_enabled(): SUCCESS
rule=ipa,ipa-call,batch: %principal:string-to:\x3a %: batch: %action:string-to:()%(): %status:word%

