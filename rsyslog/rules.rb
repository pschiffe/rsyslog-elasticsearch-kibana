# rsyslog

# [origin software="rsyslogd" swVersion="7.4.7" x-pid="9" x-info="http://www.rsyslog.com"] exiting on signal 15.
rule=: [origin software=%pname:quoted-string% swVersion=%ver:quoted-string% x-pid=%pid:quoted-string% x-info="http://www.rsyslog.com"] %action:char-to:.%.

# [origin software="rsyslogd" swVersion="7.4.7" x-pid="9" x-info="http://www.rsyslog.com"] start
rule=: [origin software=%pname:quoted-string% swVersion=%ver:quoted-string% x-pid=%pid:quoted-string% x-info="http://www.rsyslog.com"] %action:word%


# IPA

# [Fri Feb 06 06:06:22.875298 2015] [:error] [pid 30769] ipa: INFO: [jsonserver_kerb] admin@RHEL.TEST: user_add(u'fbar', givenname=u'Foo', sn=u'Bar', cn=u'Foo Bar', displayname=u'Foo Bar', initials=u'FB', gecos=u'Foo Bar', krbprincipalname=u'fbar@RHEL.TEST', userpassword=u'********', random=False, noprivate=False, all=False, raw=False, version=u'2.112', no_members=False): SUCCESS
rule=: [%-:char-to:]%] [:error] [pid %pid:number%] ipa: INFO: [%-:char-to:]%] %principal:char-to:\x3a%: %action:char-to:(%(%parameters:char-to:)%): %status:word%

