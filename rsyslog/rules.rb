# rsyslog

# [origin software="rsyslogd" swVersion="7.4.7" x-pid="9" x-info="http://www.rsyslog.com"] exiting on signal 15.
rule=: [origin software=%pname:quoted-string% swVersion=%ver:quoted-string% x-pid=%pid:quoted-string% x-info="http://www.rsyslog.com"] %action:char-to:.%.

# [origin software="rsyslogd" swVersion="7.4.7" x-pid="9" x-info="http://www.rsyslog.com"] start
rule=: [origin software=%pname:quoted-string% swVersion=%ver:quoted-string% x-pid=%pid:quoted-string% x-info="http://www.rsyslog.com"] %action:word%


# audit

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427389321.984:439): pid=2363 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=login acct="root" exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=ssh res=failed'
rule=: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): pid=%pid:number% uid=%uid:number% auid=%auid:number% ses=%-:number% subj=%-:word% msg='op=%op:word% acct=%username:quoted-string% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427387571.280:371): pid=2239 uid=0 auid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 msg='op=login id=0 exe="/usr/sbin/sshd" hostname=192.168.122.1 addr=192.168.122.1 terminal=/dev/pts/0 res=success'
rule=: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): pid=%pid:number% uid=%uid:number% auid=%auid:number% ses=%-:number% subj=%-:word% msg='op=%op:word% id=%-:number% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'


# IPA

# [Fri Feb 06 06:06:22.875298 2015] [:error] [pid 30769] ipa: INFO: [jsonserver_kerb] admin@RHEL.TEST: user_add(u'fbar', givenname=u'Foo', sn=u'Bar', cn=u'Foo Bar', displayname=u'Foo Bar', initials=u'FB', gecos=u'Foo Bar', krbprincipalname=u'fbar@RHEL.TEST', userpassword=u'********', random=False, noprivate=False, all=False, raw=False, version=u'2.112', no_members=False): SUCCESS
rule=: [%-:char-to:]%] [:error] [pid %pid:number%] ipa: INFO: [%-:char-to:]%] %principal:char-to:\x3a%: %action:char-to:(%(%parameters:char-to:)%): %status:word%

