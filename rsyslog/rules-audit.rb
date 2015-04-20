# audit

prefix= node=%-:word% type=%action:word% msg=audit(%-:string-to:)\x3a %): pid=%pid:number% uid=%-:number% auid=%auid:number% ses=%ses:number% subj=%subj:word% msg='

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427389321.984:439): pid=2363 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:sshd_t:s0-s0:c0.c1023 msg='op=login acct="root" exe="/usr/sbin/sshd" hostname=? addr=192.168.122.1 terminal=ssh res=failed'
rule=audit:op=%op:word% acct=%username:quoted-string% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

# node=localhost.localdomain type=USER_LOGIN msg=audit(1427387571.280:371): pid=2239 uid=0 auid=0 ses=2 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 msg='op=login id=0 exe="/usr/sbin/sshd" hostname=192.168.122.1 addr=192.168.122.1 terminal=/dev/pts/0 res=success'
rule=audit:op=%op:word% id=%uid:number% exe=%cmd:quoted-string% hostname=%src-host:word% addr=%src-addr:word% terminal=%terminal:word% res=%status:char-to:'%'

