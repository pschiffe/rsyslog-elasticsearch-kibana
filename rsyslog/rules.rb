# rsyslog

# [origin software="rsyslogd" swVersion="7.4.7" x-pid="9" x-info="http://www.rsyslog.com"] exiting on signal 15.
rule=rsyslog: [origin software="rsyslogd" swVersion=%ver:quoted-string% x-pid=%pid:quoted-string% x-info="http://www.rsyslog.com"] %action:rest%
annotate=rsyslog:+appname="rsyslog"
annotate=rsyslog:+pname="rsyslogd"

# action 'action 2' resumed (module 'omelasticsearch') [v8.8.0 try http://www.rsyslog.com/e/2359 ]
rule=rsyslog:%msg:string-to: [v% [v%ver:word% try http://www.rsyslog.com/e/%-:number% ]

# error during parsing file /etc/rsyslog.d/01.krb5.conf, on or before line 9: parameter 'statefile' required but not specified - fix config [try http://www.rsyslog.com/e/2207 ]
rule=rsyslog: %msg:string-to: [try % [try http://www.rsyslog.com/e/%-:number% ]


# audit

# node=centos-7-vm type=EOE msg=audit(1428493181.797:484):
rule=audit: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%):

# node=centos-7-vm type=NETFILTER_CFG msg=audit(1428493181.815:489): table=mangle family=2 entries=6
rule=audit: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): table=%table:word% family=%family:number% entries=%entries:number%

# node=centos-7-vm type=LOGIN msg=audit(1428420611.619:486): pid=2410 uid=0 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 old-auid=4294967295 auid=0 old-ses=4294967295 ses=4 res=1
rule=audit: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): pid=%pid:number% uid=%uid:number% subj=%subj:word% old-auid=%old-auid:number% auid=%auid:number% old-ses=%old-ses:number% ses=%ses:number% res=%status:number%

# node=centos-7-vm type=SYSCALL msg=audit(1428493181.815:489): arch=c000003e syscall=54 success=yes exit=0 a0=4 a1=0 a2=40 a3=c41850 items=0 ppid=585 pid=5905 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="iptables" exe="/usr/sbin/xtables-multi" subj=system_u:system_r:iptables_t:s0 key=(null)
rule=audit: node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): arch=%arch:word% syscall=%syscall:word% success=%status:word% exit=%exit:number% a0=%a0:word% a1=%a1:word% a2=%a2:word% a3=%a3:word% items=%items:number% ppid=%ppid:number% pid=%pid:number% auid=%auid:number% uid=%uid:number% gid=%gid:number% euid=%euid:number% suid=%suid:number% fsuid=%fsuid:number% egid=%egid:number% sgid=%sgid:number% fsgid=%fsgid:number% tty=%tty:word% ses=%ses:number% comm=%comm:quoted-string% exe=%cmd:quoted-string% subj=%subj:word% key=%key:word%

prefix= node=%-:word% type=%action:word% msg=audit(%-:char-to:)%): pid=%pid:number% uid=%uid:number% auid=%auid:number% ses=%ses:number% subj=%subj:word% msg='

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427389321.984:439): pid=2363 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=login acct="root" exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=ssh res=failed'
rule=audit:op=%op:word% acct=%username:quoted-string%%-:whitespace%exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427387571.280:371): pid=2239 uid=0 auid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 msg='op=login id=0 exe="/usr/sbin/sshd" hostname=192.168.122.1 addr=192.168.122.1 terminal=/dev/pts/0 res=success'
rule=audit:op=%op:word% id=%-:number% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=CRYPTO_KEY_USER msg=audit(1428420611.616:483): pid=2410 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=destroy kind=session fp=? direction=both spid=2411 suid=74 rport=49316 laddr=192.168.122.85 lport=22  exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=? res=success'
rule=audit:op=%op:word% kind=%kind:word% fp=%fp:word% direction=%direction:word% spid=%spid:number% suid=%suid:number% rport=%src-port:number% laddr=%dst-addr:word% lport=%dst-port:number%  exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=CRYPTO_KEY_USER msg=audit(1428068294.243:903): pid=3020 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=destroy kind=server fp=68:07:f9:9d:3c:5b:ac:80:17:68:c7:50:15:38:a5:a2 direction=? spid=3020 suid=0  exe=\"/usr/sbin/sshd\" hostname=? addr=192.168.122.1 terminal=? res=success'
rule=audit:op=%op:word% kind=%kind:word% fp=%fp:word% direction=%direction:word% spid=%spid:number% suid=%suid:number%  exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=CRED_ACQ msg=audit(1428420611.619:485): pid=2410 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=PAM:setcred grantors=pam_unix acct="root" exe="/usr/sbin/sshd" hostname=192.168.122.1 addr=192.168.122.1 terminal=ssh res=success'
rule=audit:op=%op:word% grantors=%grantors:word% acct=%username:quoted-string% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=USER_ROLE_CHANGE msg=audit(1428420611.683:487): pid=2410 uid=0 auid=0 ses=4 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='pam: default-context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 selected-context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 exe="/usr/sbin/sshd" hostname=192.168.122.1 addr=192.168.122.1 terminal=ssh res=success'
rule=audit:pam: default-context=%default-context:word% selected-context=%selected-context:word% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=CRYPTO_SESSION msg=audit(1428420609.734:476): pid=2410 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=start direction=from-client cipher=aes128-ctr ksize=128 mac=hmac-md5-etm@openssh.com pfs=ecdh-sha2-nistp256 spid=2411 suid=74 rport=49316 laddr=192.168.122.85 lport=22 exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=? res=success'
rule=audit:op=%op:word% direction=%direction:word% cipher=%cipher:word% ksize=%ksize:number% mac=%mac:word% pfs=%pfs:word% spid=%spid:number% suid=%suid:number% rport=%src-port:number% laddr=%dst-addr:word% lport=%dst-port:number%  exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=USER_AUTH msg=audit(1428420609.076:464): pid=2406 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=maxtries exceeded acct="root" exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=ssh res=failed'
rule=audit:op=%op:string-to: acct% acct=%username:quoted-string% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=SERVICE_START msg=audit(1428494076.581:544): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg=' comm="rsyslog" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
rule=audit: comm=%comm:quoted-string% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=centos-7-vm type=SYSTEM_RUNLEVEL msg=audit(1428498521.695:45): pid=2390 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='old-level=N new-level=3 exe="/usr/lib/systemd/systemd-update-utmp" hostname=? addr=? terminal=? res=success'
rule=audit:old-level=%old-level:word% new-level=%new-level:word% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

prefix=


# IPA

prefix= [%-:char-to:]%] [:error] [pid %pid:number%] ipa: INFO:

# [Fri Feb 06 06:06:22.875298 2015] [:error] [pid 30769] ipa: INFO: [jsonserver_kerb] admin@RHEL.TEST: user_add(u'fbar', givenname=u'Foo', sn=u'Bar', cn=u'Foo Bar', displayname=u'Foo Bar', initials=u'FB', gecos=u'Foo Bar', krbprincipalname=u'fbar@RHEL.TEST', userpassword=u'********', random=False, noprivate=False, all=False, raw=False, version=u'2.112', no_members=False): SUCCESS
rule=ipa,ipa-call: [%-:char-to:]%] %principal:char-to:\x3a%: %action:char-to:(%(%parameters:string-to:)\x3a %): %status:word%

# [Wed Apr 08 16:07:37.772664 2015] [:error] [pid 2139] ipa: INFO: admin@KVM: batch: user_show(u'admin', no_members=True): SUCCESS
rule=ipa,ipa-call,batch: %principal:char-to:\x3a%: batch: %action:char-to:(%(%parameters:string-to:): %): %status:word%

# [Wed Apr 08 16:56:29.257898 2015] [:error] [pid 2139] ipa: INFO: admin@KVM: batch: dns_is_enabled(): SUCCESS
rule=ipa,ipa-call,batch: %principal:char-to:\x3a%: batch: %action:char-to:(%(): %status:word%

# [Wed Apr 08 16:07:17.561744 2015] [:error] [pid 2139] ipa: INFO: 401 Unauthorized: kinit: Preauthentication failed while getting initial credentials
rule=ipa,kinit: %status-code:number% %status-string:char-to:\x3a%: kinit: %msg:rest%

