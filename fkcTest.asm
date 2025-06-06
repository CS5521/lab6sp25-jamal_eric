
_fkcTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
   printf(1, "%d\n", fkc());
   9:	e8 2d 03 00 00       	call   33b <fkc>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 ef 07 00 	movl   $0x7ef,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 fd 03 00 00       	call   423 <printf>
   exit();
  26:	e8 68 02 00 00       	call   293 <exit>

0000002b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2b:	55                   	push   %ebp
  2c:	89 e5                	mov    %esp,%ebp
  2e:	57                   	push   %edi
  2f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  33:	8b 55 10             	mov    0x10(%ebp),%edx
  36:	8b 45 0c             	mov    0xc(%ebp),%eax
  39:	89 cb                	mov    %ecx,%ebx
  3b:	89 df                	mov    %ebx,%edi
  3d:	89 d1                	mov    %edx,%ecx
  3f:	fc                   	cld    
  40:	f3 aa                	rep stos %al,%es:(%edi)
  42:	89 ca                	mov    %ecx,%edx
  44:	89 fb                	mov    %edi,%ebx
  46:	89 5d 08             	mov    %ebx,0x8(%ebp)
  49:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4c:	5b                   	pop    %ebx
  4d:	5f                   	pop    %edi
  4e:	5d                   	pop    %ebp
  4f:	c3                   	ret    

00000050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  56:	8b 45 08             	mov    0x8(%ebp),%eax
  59:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5c:	90                   	nop
  5d:	8b 45 08             	mov    0x8(%ebp),%eax
  60:	8d 50 01             	lea    0x1(%eax),%edx
  63:	89 55 08             	mov    %edx,0x8(%ebp)
  66:	8b 55 0c             	mov    0xc(%ebp),%edx
  69:	8d 4a 01             	lea    0x1(%edx),%ecx
  6c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  6f:	0f b6 12             	movzbl (%edx),%edx
  72:	88 10                	mov    %dl,(%eax)
  74:	0f b6 00             	movzbl (%eax),%eax
  77:	84 c0                	test   %al,%al
  79:	75 e2                	jne    5d <strcpy+0xd>
    ;
  return os;
  7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7e:	c9                   	leave  
  7f:	c3                   	ret    

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  83:	eb 08                	jmp    8d <strcmp+0xd>
    p++, q++;
  85:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  89:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  8d:	8b 45 08             	mov    0x8(%ebp),%eax
  90:	0f b6 00             	movzbl (%eax),%eax
  93:	84 c0                	test   %al,%al
  95:	74 10                	je     a7 <strcmp+0x27>
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	0f b6 10             	movzbl (%eax),%edx
  9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  a0:	0f b6 00             	movzbl (%eax),%eax
  a3:	38 c2                	cmp    %al,%dl
  a5:	74 de                	je     85 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	0f b6 00             	movzbl (%eax),%eax
  ad:	0f b6 d0             	movzbl %al,%edx
  b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  b3:	0f b6 00             	movzbl (%eax),%eax
  b6:	0f b6 c0             	movzbl %al,%eax
  b9:	29 c2                	sub    %eax,%edx
  bb:	89 d0                	mov    %edx,%eax
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <strlen>:

uint
strlen(const char *s)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cc:	eb 04                	jmp    d2 <strlen+0x13>
  ce:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	01 d0                	add    %edx,%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 ed                	jne    ce <strlen+0xf>
    ;
  return n;
  e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  e9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  ec:	8b 45 10             	mov    0x10(%ebp),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 45 08             	mov    0x8(%ebp),%eax
  fd:	89 04 24             	mov    %eax,(%esp)
 100:	e8 26 ff ff ff       	call   2b <stosb>
  return dst;
 105:	8b 45 08             	mov    0x8(%ebp),%eax
}
 108:	c9                   	leave  
 109:	c3                   	ret    

0000010a <strchr>:

char*
strchr(const char *s, char c)
{
 10a:	55                   	push   %ebp
 10b:	89 e5                	mov    %esp,%ebp
 10d:	83 ec 04             	sub    $0x4,%esp
 110:	8b 45 0c             	mov    0xc(%ebp),%eax
 113:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 116:	eb 14                	jmp    12c <strchr+0x22>
    if(*s == c)
 118:	8b 45 08             	mov    0x8(%ebp),%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 121:	75 05                	jne    128 <strchr+0x1e>
      return (char*)s;
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	eb 13                	jmp    13b <strchr+0x31>
  for(; *s; s++)
 128:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	0f b6 00             	movzbl (%eax),%eax
 132:	84 c0                	test   %al,%al
 134:	75 e2                	jne    118 <strchr+0xe>
  return 0;
 136:	b8 00 00 00 00       	mov    $0x0,%eax
}
 13b:	c9                   	leave  
 13c:	c3                   	ret    

0000013d <gets>:

char*
gets(char *buf, int max)
{
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 143:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 14a:	eb 4c                	jmp    198 <gets+0x5b>
    cc = read(0, &c, 1);
 14c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 153:	00 
 154:	8d 45 ef             	lea    -0x11(%ebp),%eax
 157:	89 44 24 04          	mov    %eax,0x4(%esp)
 15b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 162:	e8 44 01 00 00       	call   2ab <read>
 167:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 16a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16e:	7f 02                	jg     172 <gets+0x35>
      break;
 170:	eb 31                	jmp    1a3 <gets+0x66>
    buf[i++] = c;
 172:	8b 45 f4             	mov    -0xc(%ebp),%eax
 175:	8d 50 01             	lea    0x1(%eax),%edx
 178:	89 55 f4             	mov    %edx,-0xc(%ebp)
 17b:	89 c2                	mov    %eax,%edx
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
 180:	01 c2                	add    %eax,%edx
 182:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 186:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0a                	cmp    $0xa,%al
 18e:	74 13                	je     1a3 <gets+0x66>
 190:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 194:	3c 0d                	cmp    $0xd,%al
 196:	74 0b                	je     1a3 <gets+0x66>
  for(i=0; i+1 < max; ){
 198:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19b:	83 c0 01             	add    $0x1,%eax
 19e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a1:	7c a9                	jl     14c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	01 d0                	add    %edx,%eax
 1ab:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b1:	c9                   	leave  
 1b2:	c3                   	ret    

000001b3 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1c0:	00 
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	89 04 24             	mov    %eax,(%esp)
 1c7:	e8 07 01 00 00       	call   2d3 <open>
 1cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d3:	79 07                	jns    1dc <stat+0x29>
    return -1;
 1d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1da:	eb 23                	jmp    1ff <stat+0x4c>
  r = fstat(fd, st);
 1dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1df:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e6:	89 04 24             	mov    %eax,(%esp)
 1e9:	e8 fd 00 00 00       	call   2eb <fstat>
 1ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f4:	89 04 24             	mov    %eax,(%esp)
 1f7:	e8 bf 00 00 00       	call   2bb <close>
  return r;
 1fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <atoi>:

int
atoi(const char *s)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 207:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20e:	eb 25                	jmp    235 <atoi+0x34>
    n = n*10 + *s++ - '0';
 210:	8b 55 fc             	mov    -0x4(%ebp),%edx
 213:	89 d0                	mov    %edx,%eax
 215:	c1 e0 02             	shl    $0x2,%eax
 218:	01 d0                	add    %edx,%eax
 21a:	01 c0                	add    %eax,%eax
 21c:	89 c1                	mov    %eax,%ecx
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	8d 50 01             	lea    0x1(%eax),%edx
 224:	89 55 08             	mov    %edx,0x8(%ebp)
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	0f be c0             	movsbl %al,%eax
 22d:	01 c8                	add    %ecx,%eax
 22f:	83 e8 30             	sub    $0x30,%eax
 232:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 235:	8b 45 08             	mov    0x8(%ebp),%eax
 238:	0f b6 00             	movzbl (%eax),%eax
 23b:	3c 2f                	cmp    $0x2f,%al
 23d:	7e 0a                	jle    249 <atoi+0x48>
 23f:	8b 45 08             	mov    0x8(%ebp),%eax
 242:	0f b6 00             	movzbl (%eax),%eax
 245:	3c 39                	cmp    $0x39,%al
 247:	7e c7                	jle    210 <atoi+0xf>
  return n;
 249:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 24c:	c9                   	leave  
 24d:	c3                   	ret    

0000024e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 260:	eb 17                	jmp    279 <memmove+0x2b>
    *dst++ = *src++;
 262:	8b 45 fc             	mov    -0x4(%ebp),%eax
 265:	8d 50 01             	lea    0x1(%eax),%edx
 268:	89 55 fc             	mov    %edx,-0x4(%ebp)
 26b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26e:	8d 4a 01             	lea    0x1(%edx),%ecx
 271:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 274:	0f b6 12             	movzbl (%edx),%edx
 277:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 279:	8b 45 10             	mov    0x10(%ebp),%eax
 27c:	8d 50 ff             	lea    -0x1(%eax),%edx
 27f:	89 55 10             	mov    %edx,0x10(%ebp)
 282:	85 c0                	test   %eax,%eax
 284:	7f dc                	jg     262 <memmove+0x14>
  return vdst;
 286:	8b 45 08             	mov    0x8(%ebp),%eax
}
 289:	c9                   	leave  
 28a:	c3                   	ret    

0000028b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28b:	b8 01 00 00 00       	mov    $0x1,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <exit>:
SYSCALL(exit)
 293:	b8 02 00 00 00       	mov    $0x2,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <wait>:
SYSCALL(wait)
 29b:	b8 03 00 00 00       	mov    $0x3,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <pipe>:
SYSCALL(pipe)
 2a3:	b8 04 00 00 00       	mov    $0x4,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <read>:
SYSCALL(read)
 2ab:	b8 05 00 00 00       	mov    $0x5,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <write>:
SYSCALL(write)
 2b3:	b8 10 00 00 00       	mov    $0x10,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <close>:
SYSCALL(close)
 2bb:	b8 15 00 00 00       	mov    $0x15,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <kill>:
SYSCALL(kill)
 2c3:	b8 06 00 00 00       	mov    $0x6,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exec>:
SYSCALL(exec)
 2cb:	b8 07 00 00 00       	mov    $0x7,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <open>:
SYSCALL(open)
 2d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <mknod>:
SYSCALL(mknod)
 2db:	b8 11 00 00 00       	mov    $0x11,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <unlink>:
SYSCALL(unlink)
 2e3:	b8 12 00 00 00       	mov    $0x12,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <fstat>:
SYSCALL(fstat)
 2eb:	b8 08 00 00 00       	mov    $0x8,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <link>:
SYSCALL(link)
 2f3:	b8 13 00 00 00       	mov    $0x13,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mkdir>:
SYSCALL(mkdir)
 2fb:	b8 14 00 00 00       	mov    $0x14,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <chdir>:
SYSCALL(chdir)
 303:	b8 09 00 00 00       	mov    $0x9,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <dup>:
SYSCALL(dup)
 30b:	b8 0a 00 00 00       	mov    $0xa,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <getpid>:
SYSCALL(getpid)
 313:	b8 0b 00 00 00       	mov    $0xb,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <sbrk>:
SYSCALL(sbrk)
 31b:	b8 0c 00 00 00       	mov    $0xc,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <sleep>:
SYSCALL(sleep)
 323:	b8 0d 00 00 00       	mov    $0xd,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <uptime>:
SYSCALL(uptime)
 32b:	b8 0e 00 00 00       	mov    $0xe,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <hw>:
SYSCALL(hw)
 333:	b8 16 00 00 00       	mov    $0x16,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <fkc>:
SYSCALL(fkc)
 33b:	b8 17 00 00 00       	mov    $0x17,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	83 ec 18             	sub    $0x18,%esp
 349:	8b 45 0c             	mov    0xc(%ebp),%eax
 34c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 34f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 356:	00 
 357:	8d 45 f4             	lea    -0xc(%ebp),%eax
 35a:	89 44 24 04          	mov    %eax,0x4(%esp)
 35e:	8b 45 08             	mov    0x8(%ebp),%eax
 361:	89 04 24             	mov    %eax,(%esp)
 364:	e8 4a ff ff ff       	call   2b3 <write>
}
 369:	c9                   	leave  
 36a:	c3                   	ret    

0000036b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	56                   	push   %esi
 36f:	53                   	push   %ebx
 370:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 373:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 37a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 37e:	74 17                	je     397 <printint+0x2c>
 380:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 384:	79 11                	jns    397 <printint+0x2c>
    neg = 1;
 386:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 38d:	8b 45 0c             	mov    0xc(%ebp),%eax
 390:	f7 d8                	neg    %eax
 392:	89 45 ec             	mov    %eax,-0x14(%ebp)
 395:	eb 06                	jmp    39d <printint+0x32>
  } else {
    x = xx;
 397:	8b 45 0c             	mov    0xc(%ebp),%eax
 39a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 39d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a7:	8d 41 01             	lea    0x1(%ecx),%eax
 3aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3b3:	ba 00 00 00 00       	mov    $0x0,%edx
 3b8:	f7 f3                	div    %ebx
 3ba:	89 d0                	mov    %edx,%eax
 3bc:	0f b6 80 40 0a 00 00 	movzbl 0xa40(%eax),%eax
 3c3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3c7:	8b 75 10             	mov    0x10(%ebp),%esi
 3ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3cd:	ba 00 00 00 00       	mov    $0x0,%edx
 3d2:	f7 f6                	div    %esi
 3d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3db:	75 c7                	jne    3a4 <printint+0x39>
  if(neg)
 3dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e1:	74 10                	je     3f3 <printint+0x88>
    buf[i++] = '-';
 3e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e6:	8d 50 01             	lea    0x1(%eax),%edx
 3e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f1:	eb 1f                	jmp    412 <printint+0xa7>
 3f3:	eb 1d                	jmp    412 <printint+0xa7>
    putc(fd, buf[i]);
 3f5:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fb:	01 d0                	add    %edx,%eax
 3fd:	0f b6 00             	movzbl (%eax),%eax
 400:	0f be c0             	movsbl %al,%eax
 403:	89 44 24 04          	mov    %eax,0x4(%esp)
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	89 04 24             	mov    %eax,(%esp)
 40d:	e8 31 ff ff ff       	call   343 <putc>
  while(--i >= 0)
 412:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 416:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 41a:	79 d9                	jns    3f5 <printint+0x8a>
}
 41c:	83 c4 30             	add    $0x30,%esp
 41f:	5b                   	pop    %ebx
 420:	5e                   	pop    %esi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    

00000423 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 429:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 430:	8d 45 0c             	lea    0xc(%ebp),%eax
 433:	83 c0 04             	add    $0x4,%eax
 436:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 439:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 440:	e9 7c 01 00 00       	jmp    5c1 <printf+0x19e>
    c = fmt[i] & 0xff;
 445:	8b 55 0c             	mov    0xc(%ebp),%edx
 448:	8b 45 f0             	mov    -0x10(%ebp),%eax
 44b:	01 d0                	add    %edx,%eax
 44d:	0f b6 00             	movzbl (%eax),%eax
 450:	0f be c0             	movsbl %al,%eax
 453:	25 ff 00 00 00       	and    $0xff,%eax
 458:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 45b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45f:	75 2c                	jne    48d <printf+0x6a>
      if(c == '%'){
 461:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 465:	75 0c                	jne    473 <printf+0x50>
        state = '%';
 467:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 46e:	e9 4a 01 00 00       	jmp    5bd <printf+0x19a>
      } else {
        putc(fd, c);
 473:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 476:	0f be c0             	movsbl %al,%eax
 479:	89 44 24 04          	mov    %eax,0x4(%esp)
 47d:	8b 45 08             	mov    0x8(%ebp),%eax
 480:	89 04 24             	mov    %eax,(%esp)
 483:	e8 bb fe ff ff       	call   343 <putc>
 488:	e9 30 01 00 00       	jmp    5bd <printf+0x19a>
      }
    } else if(state == '%'){
 48d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 491:	0f 85 26 01 00 00    	jne    5bd <printf+0x19a>
      if(c == 'd'){
 497:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 49b:	75 2d                	jne    4ca <printf+0xa7>
        printint(fd, *ap, 10, 1);
 49d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a0:	8b 00                	mov    (%eax),%eax
 4a2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a9:	00 
 4aa:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b1:	00 
 4b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
 4b9:	89 04 24             	mov    %eax,(%esp)
 4bc:	e8 aa fe ff ff       	call   36b <printint>
        ap++;
 4c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4c5:	e9 ec 00 00 00       	jmp    5b6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4ca:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ce:	74 06                	je     4d6 <printf+0xb3>
 4d0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4d4:	75 2d                	jne    503 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d9:	8b 00                	mov    (%eax),%eax
 4db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e2:	00 
 4e3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4ea:	00 
 4eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	89 04 24             	mov    %eax,(%esp)
 4f5:	e8 71 fe ff ff       	call   36b <printint>
        ap++;
 4fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4fe:	e9 b3 00 00 00       	jmp    5b6 <printf+0x193>
      } else if(c == 's'){
 503:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 507:	75 45                	jne    54e <printf+0x12b>
        s = (char*)*ap;
 509:	8b 45 e8             	mov    -0x18(%ebp),%eax
 50c:	8b 00                	mov    (%eax),%eax
 50e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 511:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 515:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 519:	75 09                	jne    524 <printf+0x101>
          s = "(null)";
 51b:	c7 45 f4 f3 07 00 00 	movl   $0x7f3,-0xc(%ebp)
        while(*s != 0){
 522:	eb 1e                	jmp    542 <printf+0x11f>
 524:	eb 1c                	jmp    542 <printf+0x11f>
          putc(fd, *s);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	0f b6 00             	movzbl (%eax),%eax
 52c:	0f be c0             	movsbl %al,%eax
 52f:	89 44 24 04          	mov    %eax,0x4(%esp)
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	89 04 24             	mov    %eax,(%esp)
 539:	e8 05 fe ff ff       	call   343 <putc>
          s++;
 53e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 542:	8b 45 f4             	mov    -0xc(%ebp),%eax
 545:	0f b6 00             	movzbl (%eax),%eax
 548:	84 c0                	test   %al,%al
 54a:	75 da                	jne    526 <printf+0x103>
 54c:	eb 68                	jmp    5b6 <printf+0x193>
        }
      } else if(c == 'c'){
 54e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 552:	75 1d                	jne    571 <printf+0x14e>
        putc(fd, *ap);
 554:	8b 45 e8             	mov    -0x18(%ebp),%eax
 557:	8b 00                	mov    (%eax),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	89 44 24 04          	mov    %eax,0x4(%esp)
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	89 04 24             	mov    %eax,(%esp)
 566:	e8 d8 fd ff ff       	call   343 <putc>
        ap++;
 56b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 56f:	eb 45                	jmp    5b6 <printf+0x193>
      } else if(c == '%'){
 571:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 575:	75 17                	jne    58e <printf+0x16b>
        putc(fd, c);
 577:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57a:	0f be c0             	movsbl %al,%eax
 57d:	89 44 24 04          	mov    %eax,0x4(%esp)
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	89 04 24             	mov    %eax,(%esp)
 587:	e8 b7 fd ff ff       	call   343 <putc>
 58c:	eb 28                	jmp    5b6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 595:	00 
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	89 04 24             	mov    %eax,(%esp)
 59c:	e8 a2 fd ff ff       	call   343 <putc>
        putc(fd, c);
 5a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a4:	0f be c0             	movsbl %al,%eax
 5a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	89 04 24             	mov    %eax,(%esp)
 5b1:	e8 8d fd ff ff       	call   343 <putc>
      }
      state = 0;
 5b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c7:	01 d0                	add    %edx,%eax
 5c9:	0f b6 00             	movzbl (%eax),%eax
 5cc:	84 c0                	test   %al,%al
 5ce:	0f 85 71 fe ff ff    	jne    445 <printf+0x22>
    }
  }
}
 5d4:	c9                   	leave  
 5d5:	c3                   	ret    

000005d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d6:	55                   	push   %ebp
 5d7:	89 e5                	mov    %esp,%ebp
 5d9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	83 e8 08             	sub    $0x8,%eax
 5e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e5:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 5ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ed:	eb 24                	jmp    613 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f2:	8b 00                	mov    (%eax),%eax
 5f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f7:	77 12                	ja     60b <free+0x35>
 5f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ff:	77 24                	ja     625 <free+0x4f>
 601:	8b 45 fc             	mov    -0x4(%ebp),%eax
 604:	8b 00                	mov    (%eax),%eax
 606:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 609:	77 1a                	ja     625 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60e:	8b 00                	mov    (%eax),%eax
 610:	89 45 fc             	mov    %eax,-0x4(%ebp)
 613:	8b 45 f8             	mov    -0x8(%ebp),%eax
 616:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 619:	76 d4                	jbe    5ef <free+0x19>
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 623:	76 ca                	jbe    5ef <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 625:	8b 45 f8             	mov    -0x8(%ebp),%eax
 628:	8b 40 04             	mov    0x4(%eax),%eax
 62b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 632:	8b 45 f8             	mov    -0x8(%ebp),%eax
 635:	01 c2                	add    %eax,%edx
 637:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	39 c2                	cmp    %eax,%edx
 63e:	75 24                	jne    664 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 640:	8b 45 f8             	mov    -0x8(%ebp),%eax
 643:	8b 50 04             	mov    0x4(%eax),%edx
 646:	8b 45 fc             	mov    -0x4(%ebp),%eax
 649:	8b 00                	mov    (%eax),%eax
 64b:	8b 40 04             	mov    0x4(%eax),%eax
 64e:	01 c2                	add    %eax,%edx
 650:	8b 45 f8             	mov    -0x8(%ebp),%eax
 653:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
 659:	8b 00                	mov    (%eax),%eax
 65b:	8b 10                	mov    (%eax),%edx
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	89 10                	mov    %edx,(%eax)
 662:	eb 0a                	jmp    66e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	8b 10                	mov    (%eax),%edx
 669:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 66e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 671:	8b 40 04             	mov    0x4(%eax),%eax
 674:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	01 d0                	add    %edx,%eax
 680:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 683:	75 20                	jne    6a5 <free+0xcf>
    p->s.size += bp->s.size;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 50 04             	mov    0x4(%eax),%edx
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	8b 40 04             	mov    0x4(%eax),%eax
 691:	01 c2                	add    %eax,%edx
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	8b 10                	mov    (%eax),%edx
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	89 10                	mov    %edx,(%eax)
 6a3:	eb 08                	jmp    6ad <free+0xd7>
  } else
    p->s.ptr = bp;
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ab:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	a3 5c 0a 00 00       	mov    %eax,0xa5c
}
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <morecore>:

static Header*
morecore(uint nu)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6bd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6c4:	77 07                	ja     6cd <morecore+0x16>
    nu = 4096;
 6c6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	c1 e0 03             	shl    $0x3,%eax
 6d3:	89 04 24             	mov    %eax,(%esp)
 6d6:	e8 40 fc ff ff       	call   31b <sbrk>
 6db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6de:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6e2:	75 07                	jne    6eb <morecore+0x34>
    return 0;
 6e4:	b8 00 00 00 00       	mov    $0x0,%eax
 6e9:	eb 22                	jmp    70d <morecore+0x56>
  hp = (Header*)p;
 6eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f4:	8b 55 08             	mov    0x8(%ebp),%edx
 6f7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fd:	83 c0 08             	add    $0x8,%eax
 700:	89 04 24             	mov    %eax,(%esp)
 703:	e8 ce fe ff ff       	call   5d6 <free>
  return freep;
 708:	a1 5c 0a 00 00       	mov    0xa5c,%eax
}
 70d:	c9                   	leave  
 70e:	c3                   	ret    

0000070f <malloc>:

void*
malloc(uint nbytes)
{
 70f:	55                   	push   %ebp
 710:	89 e5                	mov    %esp,%ebp
 712:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	83 c0 07             	add    $0x7,%eax
 71b:	c1 e8 03             	shr    $0x3,%eax
 71e:	83 c0 01             	add    $0x1,%eax
 721:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 724:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 729:	89 45 f0             	mov    %eax,-0x10(%ebp)
 72c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 730:	75 23                	jne    755 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 732:	c7 45 f0 54 0a 00 00 	movl   $0xa54,-0x10(%ebp)
 739:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73c:	a3 5c 0a 00 00       	mov    %eax,0xa5c
 741:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 746:	a3 54 0a 00 00       	mov    %eax,0xa54
    base.s.size = 0;
 74b:	c7 05 58 0a 00 00 00 	movl   $0x0,0xa58
 752:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 755:	8b 45 f0             	mov    -0x10(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 75d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 766:	72 4d                	jb     7b5 <malloc+0xa6>
      if(p->s.size == nunits)
 768:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 771:	75 0c                	jne    77f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77b:	89 10                	mov    %edx,(%eax)
 77d:	eb 26                	jmp    7a5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 77f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 782:	8b 40 04             	mov    0x4(%eax),%eax
 785:	2b 45 ec             	sub    -0x14(%ebp),%eax
 788:	89 c2                	mov    %eax,%edx
 78a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 790:	8b 45 f4             	mov    -0xc(%ebp),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	c1 e0 03             	shl    $0x3,%eax
 799:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 79c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7a2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a8:	a3 5c 0a 00 00       	mov    %eax,0xa5c
      return (void*)(p + 1);
 7ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b0:	83 c0 08             	add    $0x8,%eax
 7b3:	eb 38                	jmp    7ed <malloc+0xde>
    }
    if(p == freep)
 7b5:	a1 5c 0a 00 00       	mov    0xa5c,%eax
 7ba:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7bd:	75 1b                	jne    7da <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c2:	89 04 24             	mov    %eax,(%esp)
 7c5:	e8 ed fe ff ff       	call   6b7 <morecore>
 7ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d1:	75 07                	jne    7da <malloc+0xcb>
        return 0;
 7d3:	b8 00 00 00 00       	mov    $0x0,%eax
 7d8:	eb 13                	jmp    7ed <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7e8:	e9 70 ff ff ff       	jmp    75d <malloc+0x4e>
}
 7ed:	c9                   	leave  
 7ee:	c3                   	ret    
