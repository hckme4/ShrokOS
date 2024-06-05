#ifndef _SIGNAL_H_
#define _SIGNAL_H_


/* SIGNALS. DO NOT CHANGE THESE */
#define NSIG	20
#define		SIGHUP	1
#define		SIGINT	2
#define		SIGQIT	3
#define		SIGINS	4
#define		SIGTRC	5
#define		SIGIOT	6
#define		SIGEMT	7
#define		SIGFPT	8
#define		SIGKIL	9
#define		SIGBUS	10
#define		SIGSEG	11
#define		SIGSYS	12
#define		SIGPIPE	13

/* tunables */
#define 	NBUF	15
#define		NINODE	100
#define		NFILE	100
#define		NMOUNT	5
#define		NEXEC	3
#define		MAXMEM	(64*32)

#define		SSIZE	20
#define		SINCR	20
#define		NOFILE	15
#define		CANBSIZ	256
#define		SMAPSIZ 100
#define		NCALL	20
#define		NPROC	50
#define		NTEXT	40
#define		NCLIST	100
#define		HZ	60

/* priorities: beware altering these! */

#define		PSWP	-100
#define		PINOD	-90
#define		PRIBIO	-50
#define		PPIPE	1
#define		PWAIT	40
#define		PSLEP	90
#define		PUSER	100

/* Certain processor registers */

#define		PS	0177776
#define		KL	0177560
#define		SW	0177570

/*----------------*/

/* structure to access */

/* integer */
struct {int integ;};

/* integer in bytes */
struct {char lobyte; char hibyte;};

/* sequence of integers */
struct {int r[];};

/*-----------------*/


#endif
