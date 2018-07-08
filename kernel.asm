
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00100000 <string_to_uint-0x10>:
  100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fb                   	sti    
  100009:	4f                   	dec    %edi
  10000a:	52                   	push   %edx
  10000b:	e4 66                	in     $0x66,%al
  10000d:	90                   	nop
  10000e:	66 90                	xchg   %ax,%ax

00100010 <string_to_uint>:

string basechar     = "0123456789abcdefghijklmnopqrstuvwxyz";
string basechar_maj = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

u32 string_to_uint(string str, u8 base)
{
  100010:	55                   	push   %ebp
  100011:	57                   	push   %edi
  100012:	56                   	push   %esi
  100013:	53                   	push   %ebx
  100014:	83 ec 10             	sub    $0x10,%esp
  100017:	8b 44 24 24          	mov    0x24(%esp),%eax
  10001b:	8b 54 24 28          	mov    0x28(%esp),%edx
    u32 i = 0;
    u32 value = 0;

    while (str[i])
  10001f:	0f b6 08             	movzbl (%eax),%ecx
{
  100022:	88 54 24 07          	mov    %dl,0x7(%esp)
    while (str[i])
  100026:	84 c9                	test   %cl,%cl
  100028:	0f 84 85 00 00 00    	je     1000b3 <string_to_uint+0xa3>
  10002e:	8b 2d 04 70 10 00    	mov    0x107004,%ebp
  100034:	8b 3d 00 70 10 00    	mov    0x107000,%edi
  10003a:	0f b6 f2             	movzbl %dl,%esi
  10003d:	83 c0 01             	add    $0x1,%eax
  100040:	89 74 24 0c          	mov    %esi,0xc(%esp)
  100044:	31 f6                	xor    %esi,%esi
  100046:	89 44 24 08          	mov    %eax,0x8(%esp)
  10004a:	31 c0                	xor    %eax,%eax
  10004c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    {
        value = value * base;
  100050:	0f af 44 24 0c       	imul   0xc(%esp),%eax

        for (u8 j = 0; j < base; j++)
  100055:	80 7c 24 07 00       	cmpb   $0x0,0x7(%esp)
  10005a:	74 3e                	je     10009a <string_to_uint+0x8a>
  10005c:	31 d2                	xor    %edx,%edx
  10005e:	89 04 24             	mov    %eax,(%esp)
  100061:	eb 0d                	jmp    100070 <string_to_uint+0x60>
  100063:	90                   	nop
  100064:	90                   	nop
  100065:	90                   	nop
  100066:	90                   	nop
  100067:	90                   	nop
  100068:	90                   	nop
  100069:	90                   	nop
  10006a:	90                   	nop
  10006b:	90                   	nop
  10006c:	90                   	nop
  10006d:	90                   	nop
  10006e:	90                   	nop
  10006f:	90                   	nop
        {
            if ((basechar[j] == str[i]) | (basechar_maj[j] == str[i]))
  100070:	38 4c 15 00          	cmp    %cl,0x0(%ebp,%edx,1)
  100074:	0f 94 44 24 06       	sete   0x6(%esp)
  100079:	38 0c 17             	cmp    %cl,(%edi,%edx,1)
  10007c:	0f b6 44 24 06       	movzbl 0x6(%esp),%eax
  100081:	0f 94 c3             	sete   %bl
  100084:	08 d8                	or     %bl,%al
  100086:	89 f3                	mov    %esi,%ebx
  100088:	0f 45 da             	cmovne %edx,%ebx
  10008b:	83 c2 01             	add    $0x1,%edx
  10008e:	01 1c 24             	add    %ebx,(%esp)
        for (u8 j = 0; j < base; j++)
  100091:	38 54 24 07          	cmp    %dl,0x7(%esp)
  100095:	77 d9                	ja     100070 <string_to_uint+0x60>
  100097:	8b 04 24             	mov    (%esp),%eax
  10009a:	83 44 24 08 01       	addl   $0x1,0x8(%esp)
  10009f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    while (str[i])
  1000a3:	0f b6 49 ff          	movzbl -0x1(%ecx),%ecx
  1000a7:	84 c9                	test   %cl,%cl
  1000a9:	75 a5                	jne    100050 <string_to_uint+0x40>

        i++;
    }

    return value;
}
  1000ab:	83 c4 10             	add    $0x10,%esp
  1000ae:	5b                   	pop    %ebx
  1000af:	5e                   	pop    %esi
  1000b0:	5f                   	pop    %edi
  1000b1:	5d                   	pop    %ebp
  1000b2:	c3                   	ret    
  1000b3:	83 c4 10             	add    $0x10,%esp
    u32 value = 0;
  1000b6:	31 c0                	xor    %eax,%eax
}
  1000b8:	5b                   	pop    %ebx
  1000b9:	5e                   	pop    %esi
  1000ba:	5f                   	pop    %edi
  1000bb:	5d                   	pop    %ebp
  1000bc:	c3                   	ret    
  1000bd:	8d 76 00             	lea    0x0(%esi),%esi

001000c0 <uint_to_string>:

void uint_to_string(u32 value, string buffer, u8 base)
{
  1000c0:	57                   	push   %edi
  1000c1:	56                   	push   %esi
  1000c2:	53                   	push   %ebx
  1000c3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1000c7:	8b 7c 24 14          	mov    0x14(%esp),%edi
  1000cb:	0f b6 74 24 18       	movzbl 0x18(%esp),%esi
    buffer[0] = '\0';   
    if (value == 0){ strapd(buffer, '0'); return; }
  1000d0:	85 db                	test   %ebx,%ebx
    buffer[0] = '\0';   
  1000d2:	c6 07 00             	movb   $0x0,(%edi)
    if (value == 0){ strapd(buffer, '0'); return; }
  1000d5:	74 39                	je     100110 <uint_to_string+0x50>
  1000d7:	89 f6                	mov    %esi,%esi
  1000d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    
    u32 v = value;

    while (v != 0)
    {
        strapd(buffer, basechar_maj[v % base]);
  1000e0:	89 d8                	mov    %ebx,%eax
  1000e2:	31 d2                	xor    %edx,%edx
  1000e4:	83 ec 08             	sub    $0x8,%esp
  1000e7:	f7 f6                	div    %esi
  1000e9:	89 c3                	mov    %eax,%ebx
  1000eb:	a1 00 70 10 00       	mov    0x107000,%eax
  1000f0:	0f be 04 10          	movsbl (%eax,%edx,1),%eax
  1000f4:	50                   	push   %eax
  1000f5:	57                   	push   %edi
  1000f6:	e8 b5 02 00 00       	call   1003b0 <strapd>
    while (v != 0)
  1000fb:	83 c4 10             	add    $0x10,%esp
  1000fe:	85 db                	test   %ebx,%ebx
  100100:	75 de                	jne    1000e0 <uint_to_string+0x20>
        v /= base;
    }

    strrvs(buffer);
  100102:	89 7c 24 10          	mov    %edi,0x10(%esp)
  100106:	5b                   	pop    %ebx
  100107:	5e                   	pop    %esi
  100108:	5f                   	pop    %edi
    strrvs(buffer);
  100109:	e9 22 03 00 00       	jmp    100430 <strrvs>
  10010e:	66 90                	xchg   %ax,%ax
    if (value == 0){ strapd(buffer, '0'); return; }
  100110:	c7 44 24 14 30 00 00 	movl   $0x30,0x14(%esp)
  100117:	00 
  100118:	89 7c 24 10          	mov    %edi,0x10(%esp)
  10011c:	5b                   	pop    %ebx
  10011d:	5e                   	pop    %esi
  10011e:	5f                   	pop    %edi
    if (value == 0){ strapd(buffer, '0'); return; }
  10011f:	e9 8c 02 00 00       	jmp    1003b0 <strapd>
  100124:	66 90                	xchg   %ax,%ax
  100126:	66 90                	xchg   %ax,%ax
  100128:	66 90                	xchg   %ax,%ax
  10012a:	66 90                	xchg   %ax,%ax
  10012c:	66 90                	xchg   %ax,%ax
  10012e:	66 90                	xchg   %ax,%ax

00100130 <memcpy>:
#include "memory.h"

void memcpy(u8 *dest, u8 *src, u32 len)
{
  100130:	55                   	push   %ebp
  100131:	57                   	push   %edi
  100132:	56                   	push   %esi
  100133:	53                   	push   %ebx
  100134:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  100138:	8b 54 24 14          	mov    0x14(%esp),%edx
  10013c:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    u32 i;
    for (i = 0; i < len; i++) {
  100140:	85 ed                	test   %ebp,%ebp
  100142:	74 70                	je     1001b4 <memcpy+0x84>
  100144:	8d 42 04             	lea    0x4(%edx),%eax
  100147:	8d 71 04             	lea    0x4(%ecx),%esi
  10014a:	39 c1                	cmp    %eax,%ecx
  10014c:	0f 93 c0             	setae  %al
  10014f:	39 f2                	cmp    %esi,%edx
  100151:	0f 93 c3             	setae  %bl
  100154:	89 de                	mov    %ebx,%esi
  100156:	09 f0                	or     %esi,%eax
  100158:	83 fd 09             	cmp    $0x9,%ebp
  10015b:	0f 97 c3             	seta   %bl
  10015e:	84 d8                	test   %bl,%al
  100160:	74 5e                	je     1001c0 <memcpy+0x90>
  100162:	89 d0                	mov    %edx,%eax
  100164:	09 c8                	or     %ecx,%eax
  100166:	a8 03                	test   $0x3,%al
  100168:	75 56                	jne    1001c0 <memcpy+0x90>
  10016a:	8d 75 fc             	lea    -0x4(%ebp),%esi
  10016d:	31 c0                	xor    %eax,%eax
  10016f:	c1 ee 02             	shr    $0x2,%esi
  100172:	83 c6 01             	add    $0x1,%esi
  100175:	8d 3c b5 00 00 00 00 	lea    0x0(,%esi,4),%edi
        *(dest + i) = *(src + i);
  10017c:	8b 1c 81             	mov    (%ecx,%eax,4),%ebx
  10017f:	89 1c 82             	mov    %ebx,(%edx,%eax,4)
  100182:	83 c0 01             	add    $0x1,%eax
  100185:	39 c6                	cmp    %eax,%esi
  100187:	77 f3                	ja     10017c <memcpy+0x4c>
  100189:	39 fd                	cmp    %edi,%ebp
  10018b:	74 27                	je     1001b4 <memcpy+0x84>
  10018d:	0f b6 04 b1          	movzbl (%ecx,%esi,4),%eax
  100191:	88 04 b2             	mov    %al,(%edx,%esi,4)
    for (i = 0; i < len; i++) {
  100194:	8d 47 01             	lea    0x1(%edi),%eax
  100197:	39 c5                	cmp    %eax,%ebp
  100199:	76 19                	jbe    1001b4 <memcpy+0x84>
        *(dest + i) = *(src + i);
  10019b:	0f b6 44 39 01       	movzbl 0x1(%ecx,%edi,1),%eax
  1001a0:	88 44 3a 01          	mov    %al,0x1(%edx,%edi,1)
    for (i = 0; i < len; i++) {
  1001a4:	8d 47 02             	lea    0x2(%edi),%eax
  1001a7:	39 c5                	cmp    %eax,%ebp
  1001a9:	76 09                	jbe    1001b4 <memcpy+0x84>
        *(dest + i) = *(src + i);
  1001ab:	0f b6 44 39 02       	movzbl 0x2(%ecx,%edi,1),%eax
  1001b0:	88 44 3a 02          	mov    %al,0x2(%edx,%edi,1)
    }
}
  1001b4:	5b                   	pop    %ebx
  1001b5:	5e                   	pop    %esi
  1001b6:	5f                   	pop    %edi
  1001b7:	5d                   	pop    %ebp
  1001b8:	c3                   	ret    
  1001b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < len; i++) {
  1001c0:	31 c0                	xor    %eax,%eax
  1001c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1001c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        *(dest + i) = *(src + i);
  1001d0:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
  1001d4:	88 1c 02             	mov    %bl,(%edx,%eax,1)
    for (i = 0; i < len; i++) {
  1001d7:	83 c0 01             	add    $0x1,%eax
  1001da:	39 c5                	cmp    %eax,%ebp
  1001dc:	75 f2                	jne    1001d0 <memcpy+0xa0>
}
  1001de:	5b                   	pop    %ebx
  1001df:	5e                   	pop    %esi
  1001e0:	5f                   	pop    %edi
  1001e1:	5d                   	pop    %ebp
  1001e2:	c3                   	ret    
  1001e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1001e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001001f0 <memset>:

void memset(u8 *dest, u8  val, u32 len)
{
  1001f0:	55                   	push   %ebp
  1001f1:	57                   	push   %edi
  1001f2:	56                   	push   %esi
  1001f3:	53                   	push   %ebx
  1001f4:	83 ec 14             	sub    $0x14,%esp
  1001f7:	8b 7c 24 30          	mov    0x30(%esp),%edi
  1001fb:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  1001ff:	8b 54 24 28          	mov    0x28(%esp),%edx
    u8 *temp = (u8 *)dest;
    for ( ; len != 0; len--) *temp++ = val;
  100203:	85 ff                	test   %edi,%edi
{
  100205:	88 4c 24 07          	mov    %cl,0x7(%esp)
    for ( ; len != 0; len--) *temp++ = val;
  100209:	0f 84 04 01 00 00    	je     100313 <memset+0x123>
  10020f:	89 d0                	mov    %edx,%eax
  100211:	f7 d8                	neg    %eax
  100213:	83 e0 03             	and    $0x3,%eax
  100216:	39 f8                	cmp    %edi,%eax
  100218:	0f 47 c7             	cmova  %edi,%eax
  10021b:	83 ff 06             	cmp    $0x6,%edi
  10021e:	0f 87 fc 00 00 00    	ja     100320 <memset+0x130>
  100224:	89 f8                	mov    %edi,%eax
  100226:	8d 72 01             	lea    0x1(%edx),%esi
  100229:	83 f8 01             	cmp    $0x1,%eax
  10022c:	88 0a                	mov    %cl,(%edx)
  10022e:	89 34 24             	mov    %esi,(%esp)
  100231:	8d 77 ff             	lea    -0x1(%edi),%esi
  100234:	89 f5                	mov    %esi,%ebp
  100236:	74 50                	je     100288 <memset+0x98>
  100238:	8d 5a 02             	lea    0x2(%edx),%ebx
  10023b:	83 f8 02             	cmp    $0x2,%eax
  10023e:	88 4a 01             	mov    %cl,0x1(%edx)
  100241:	8d 6f fe             	lea    -0x2(%edi),%ebp
  100244:	89 1c 24             	mov    %ebx,(%esp)
  100247:	74 3f                	je     100288 <memset+0x98>
  100249:	8d 5a 03             	lea    0x3(%edx),%ebx
  10024c:	83 f8 03             	cmp    $0x3,%eax
  10024f:	88 4a 02             	mov    %cl,0x2(%edx)
  100252:	8d 6f fd             	lea    -0x3(%edi),%ebp
  100255:	89 1c 24             	mov    %ebx,(%esp)
  100258:	74 2e                	je     100288 <memset+0x98>
  10025a:	8d 5a 04             	lea    0x4(%edx),%ebx
  10025d:	83 f8 04             	cmp    $0x4,%eax
  100260:	88 4a 03             	mov    %cl,0x3(%edx)
  100263:	8d 6f fc             	lea    -0x4(%edi),%ebp
  100266:	89 1c 24             	mov    %ebx,(%esp)
  100269:	74 1d                	je     100288 <memset+0x98>
  10026b:	8d 5a 05             	lea    0x5(%edx),%ebx
  10026e:	83 f8 06             	cmp    $0x6,%eax
  100271:	88 4a 04             	mov    %cl,0x4(%edx)
  100274:	8d 6f fb             	lea    -0x5(%edi),%ebp
  100277:	89 1c 24             	mov    %ebx,(%esp)
  10027a:	75 0c                	jne    100288 <memset+0x98>
  10027c:	8d 5a 06             	lea    0x6(%edx),%ebx
  10027f:	8d 6f fa             	lea    -0x6(%edi),%ebp
  100282:	88 4a 05             	mov    %cl,0x5(%edx)
  100285:	89 1c 24             	mov    %ebx,(%esp)
  100288:	39 c7                	cmp    %eax,%edi
  10028a:	0f 84 83 00 00 00    	je     100313 <memset+0x123>
  100290:	29 c7                	sub    %eax,%edi
  100292:	29 c6                	sub    %eax,%esi
  100294:	89 7c 24 08          	mov    %edi,0x8(%esp)
  100298:	83 ef 04             	sub    $0x4,%edi
  10029b:	c1 ef 02             	shr    $0x2,%edi
  10029e:	83 fe 02             	cmp    $0x2,%esi
  1002a1:	8d 5f 01             	lea    0x1(%edi),%ebx
  1002a4:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
  1002ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1002af:	89 7c 24 10          	mov    %edi,0x10(%esp)
  1002b3:	76 49                	jbe    1002fe <memset+0x10e>
  1002b5:	31 f6                	xor    %esi,%esi
  1002b7:	0f b6 f9             	movzbl %cl,%edi
  1002ba:	01 d0                	add    %edx,%eax
  1002bc:	89 f3                	mov    %esi,%ebx
  1002be:	8a 5c 24 07          	mov    0x7(%esp),%bl
  1002c2:	31 d2                	xor    %edx,%edx
  1002c4:	89 de                	mov    %ebx,%esi
  1002c6:	89 f3                	mov    %esi,%ebx
  1002c8:	88 cf                	mov    %cl,%bh
  1002ca:	89 de                	mov    %ebx,%esi
  1002cc:	89 fb                	mov    %edi,%ebx
  1002ce:	c1 e7 18             	shl    $0x18,%edi
  1002d1:	c1 e3 10             	shl    $0x10,%ebx
  1002d4:	0f b7 f6             	movzwl %si,%esi
  1002d7:	09 de                	or     %ebx,%esi
  1002d9:	8b 1c 24             	mov    (%esp),%ebx
  1002dc:	09 f7                	or     %esi,%edi
  1002de:	8b 74 24 0c          	mov    0xc(%esp),%esi
  1002e2:	89 3c 90             	mov    %edi,(%eax,%edx,4)
  1002e5:	83 c2 01             	add    $0x1,%edx
  1002e8:	39 d6                	cmp    %edx,%esi
  1002ea:	77 f6                	ja     1002e2 <memset+0xf2>
  1002ec:	8b 44 24 10          	mov    0x10(%esp),%eax
  1002f0:	89 1c 24             	mov    %ebx,(%esp)
  1002f3:	01 04 24             	add    %eax,(%esp)
  1002f6:	29 c5                	sub    %eax,%ebp
  1002f8:	39 44 24 08          	cmp    %eax,0x8(%esp)
  1002fc:	74 15                	je     100313 <memset+0x123>
  1002fe:	8b 04 24             	mov    (%esp),%eax
  100301:	83 fd 01             	cmp    $0x1,%ebp
  100304:	88 08                	mov    %cl,(%eax)
  100306:	74 0b                	je     100313 <memset+0x123>
  100308:	83 fd 02             	cmp    $0x2,%ebp
  10030b:	88 48 01             	mov    %cl,0x1(%eax)
  10030e:	74 03                	je     100313 <memset+0x123>
  100310:	88 48 02             	mov    %cl,0x2(%eax)
  100313:	83 c4 14             	add    $0x14,%esp
  100316:	5b                   	pop    %ebx
  100317:	5e                   	pop    %esi
  100318:	5f                   	pop    %edi
  100319:	5d                   	pop    %ebp
  10031a:	c3                   	ret    
  10031b:	90                   	nop
  10031c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100320:	85 c0                	test   %eax,%eax
  100322:	0f 85 fe fe ff ff    	jne    100226 <memset+0x36>
    for ( ; len != 0; len--) *temp++ = val;
  100328:	89 14 24             	mov    %edx,(%esp)
  10032b:	89 fd                	mov    %edi,%ebp
  10032d:	8d 77 ff             	lea    -0x1(%edi),%esi
  100330:	e9 5b ff ff ff       	jmp    100290 <memset+0xa0>
  100335:	66 90                	xchg   %ax,%ax
  100337:	66 90                	xchg   %ax,%ax
  100339:	66 90                	xchg   %ax,%ax
  10033b:	66 90                	xchg   %ax,%ax
  10033d:	66 90                	xchg   %ax,%ax
  10033f:	90                   	nop

00100340 <strlen>:
#include "string.h"
#include "types.h"

u32 strlen(string str)
{
  100340:	8b 54 24 04          	mov    0x4(%esp),%edx
    u32 lenght = 0;
    while (str[lenght]) lenght++;
  100344:	31 c0                	xor    %eax,%eax
  100346:	80 3a 00             	cmpb   $0x0,(%edx)
  100349:	74 10                	je     10035b <strlen+0x1b>
  10034b:	90                   	nop
  10034c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100350:	83 c0 01             	add    $0x1,%eax
  100353:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100357:	75 f7                	jne    100350 <strlen+0x10>
  100359:	f3 c3                	repz ret 
    return lenght;
}
  10035b:	f3 c3                	repz ret 
  10035d:	8d 76 00             	lea    0x0(%esi),%esi

00100360 <strcmp>:

s32 strcmp(string stra, string strb)
{
  100360:	56                   	push   %esi
  100361:	53                   	push   %ebx
  100362:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100366:	8b 74 24 10          	mov    0x10(%esp),%esi
    u32 i;

    for (i = 0; stra[i] == strb[i]; i++) {
  10036a:	0f b6 13             	movzbl (%ebx),%edx
  10036d:	0f be 0e             	movsbl (%esi),%ecx
  100370:	38 d1                	cmp    %dl,%cl
  100372:	75 1f                	jne    100393 <strcmp+0x33>
        if (stra[i] == '\0') return 0;
  100374:	31 c0                	xor    %eax,%eax
  100376:	84 c9                	test   %cl,%cl
  100378:	75 0a                	jne    100384 <strcmp+0x24>
  10037a:	eb 1c                	jmp    100398 <strcmp+0x38>
  10037c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100380:	84 d2                	test   %dl,%dl
  100382:	74 1c                	je     1003a0 <strcmp+0x40>
    for (i = 0; stra[i] == strb[i]; i++) {
  100384:	83 c0 01             	add    $0x1,%eax
  100387:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  10038b:	0f be 0c 06          	movsbl (%esi,%eax,1),%ecx
  10038f:	38 ca                	cmp    %cl,%dl
  100391:	74 ed                	je     100380 <strcmp+0x20>
    }

    return stra[i] - strb[i];
  100393:	0f be c2             	movsbl %dl,%eax
  100396:	29 c8                	sub    %ecx,%eax
}
  100398:	5b                   	pop    %ebx
  100399:	5e                   	pop    %esi
  10039a:	c3                   	ret    
  10039b:	90                   	nop
  10039c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (stra[i] == '\0') return 0;
  1003a0:	31 c0                	xor    %eax,%eax
}
  1003a2:	5b                   	pop    %ebx
  1003a3:	5e                   	pop    %esi
  1003a4:	c3                   	ret    
  1003a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1003a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001003b0 <strapd>:

void strapd(string str, char c) 
{
  1003b0:	57                   	push   %edi
  1003b1:	56                   	push   %esi
  1003b2:	53                   	push   %ebx
  1003b3:	8b 74 24 10          	mov    0x10(%esp),%esi
  1003b7:	8b 7c 24 14          	mov    0x14(%esp),%edi
    while (str[lenght]) lenght++;
  1003bb:	80 3e 00             	cmpb   $0x0,(%esi)
  1003be:	74 2f                	je     1003ef <strapd+0x3f>
  1003c0:	8d 46 01             	lea    0x1(%esi),%eax
  1003c3:	31 d2                	xor    %edx,%edx
  1003c5:	eb 0b                	jmp    1003d2 <strapd+0x22>
  1003c7:	89 f6                	mov    %esi,%esi
  1003c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1003d0:	89 da                	mov    %ebx,%edx
  1003d2:	89 c1                	mov    %eax,%ecx
  1003d4:	8d 40 01             	lea    0x1(%eax),%eax
  1003d7:	80 78 ff 00          	cmpb   $0x0,-0x1(%eax)
  1003db:	8d 5a 01             	lea    0x1(%edx),%ebx
  1003de:	75 f0                	jne    1003d0 <strapd+0x20>
  1003e0:	83 c2 02             	add    $0x2,%edx
    u32 len = strlen(str);
    str[len] = c;
  1003e3:	89 f8                	mov    %edi,%eax
  1003e5:	88 01                	mov    %al,(%ecx)
    str[len+1] = '\0';
  1003e7:	c6 04 16 00          	movb   $0x0,(%esi,%edx,1)
}
  1003eb:	5b                   	pop    %ebx
  1003ec:	5e                   	pop    %esi
  1003ed:	5f                   	pop    %edi
  1003ee:	c3                   	ret    
    while (str[lenght]) lenght++;
  1003ef:	89 f1                	mov    %esi,%ecx
  1003f1:	ba 01 00 00 00       	mov    $0x1,%edx
  1003f6:	eb eb                	jmp    1003e3 <strapd+0x33>
  1003f8:	90                   	nop
  1003f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100400 <strbs>:

void strbs(string str) 
{
  100400:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    while (str[lenght]) lenght++;
  100404:	80 39 00             	cmpb   $0x0,(%ecx)
  100407:	74 18                	je     100421 <strbs+0x21>
  100409:	31 c0                	xor    %eax,%eax
  10040b:	eb 05                	jmp    100412 <strbs+0x12>
  10040d:	8d 76 00             	lea    0x0(%esi),%esi
  100410:	89 d0                	mov    %edx,%eax
  100412:	80 7c 01 01 00       	cmpb   $0x0,0x1(%ecx,%eax,1)
  100417:	8d 50 01             	lea    0x1(%eax),%edx
  10041a:	75 f4                	jne    100410 <strbs+0x10>
    u32 len = strlen(str);
    str[len - 1] = '\0';
  10041c:	c6 04 01 00          	movb   $0x0,(%ecx,%eax,1)
  100420:	c3                   	ret    
    while (str[lenght]) lenght++;
  100421:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100426:	eb f4                	jmp    10041c <strbs+0x1c>
  100428:	90                   	nop
  100429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100430 <strrvs>:
}

void strrvs(string str) 
{
  100430:	56                   	push   %esi
  100431:	53                   	push   %ebx
  100432:	31 c0                	xor    %eax,%eax
  100434:	8b 54 24 0c          	mov    0xc(%esp),%edx
    while (str[lenght]) lenght++;
  100438:	80 3a 00             	cmpb   $0x0,(%edx)
  10043b:	75 05                	jne    100442 <strrvs+0x12>
  10043d:	eb 3b                	jmp    10047a <strrvs+0x4a>
  10043f:	90                   	nop
  100440:	89 c8                	mov    %ecx,%eax
  100442:	80 7c 02 01 00       	cmpb   $0x0,0x1(%edx,%eax,1)
  100447:	8d 48 01             	lea    0x1(%eax),%ecx
  10044a:	75 f4                	jne    100440 <strrvs+0x10>
    int c, i, j;
    for (i = 0, j = strlen(str) - 1; i < j; i++, j--) 
  10044c:	85 c0                	test   %eax,%eax
  10044e:	7e 2a                	jle    10047a <strrvs+0x4a>
  100450:	31 c9                	xor    %ecx,%ecx
  100452:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
        c = str[i];
  100460:	0f b6 34 0a          	movzbl (%edx,%ecx,1),%esi
        str[i] = str[j];
  100464:	0f b6 1c 02          	movzbl (%edx,%eax,1),%ebx
  100468:	88 1c 0a             	mov    %bl,(%edx,%ecx,1)
        str[j] = c;
  10046b:	89 f3                	mov    %esi,%ebx
    for (i = 0, j = strlen(str) - 1; i < j; i++, j--) 
  10046d:	83 c1 01             	add    $0x1,%ecx
        str[j] = c;
  100470:	88 1c 02             	mov    %bl,(%edx,%eax,1)
    for (i = 0, j = strlen(str) - 1; i < j; i++, j--) 
  100473:	83 e8 01             	sub    $0x1,%eax
  100476:	39 c1                	cmp    %eax,%ecx
  100478:	7c e6                	jl     100460 <strrvs+0x30>
    }
}
  10047a:	5b                   	pop    %ebx
  10047b:	5e                   	pop    %esi
  10047c:	c3                   	ret    
  10047d:	8d 76 00             	lea    0x0(%esi),%esi

00100480 <strcat>:

string strcat(string dest, string src)
{
  100480:	57                   	push   %edi
  100481:	56                   	push   %esi
    u32 i,j;
    for (i = 0; dest[i] != '\0'; i++);
  100482:	31 c9                	xor    %ecx,%ecx
{
  100484:	53                   	push   %ebx
  100485:	8b 44 24 10          	mov    0x10(%esp),%eax
  100489:	8b 74 24 14          	mov    0x14(%esp),%esi
    for (i = 0; dest[i] != '\0'; i++);
  10048d:	80 38 00             	cmpb   $0x0,(%eax)
  100490:	74 17                	je     1004a9 <strcat+0x29>
  100492:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1004a0:	83 c1 01             	add    $0x1,%ecx
  1004a3:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  1004a7:	75 f7                	jne    1004a0 <strcat+0x20>

    for (j = 0; src[j] != '\0'; j++)
  1004a9:	0f b6 1e             	movzbl (%esi),%ebx
  1004ac:	84 db                	test   %bl,%bl
  1004ae:	74 20                	je     1004d0 <strcat+0x50>
  1004b0:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  1004b3:	31 d2                	xor    %edx,%edx
  1004b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1004b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        dest[i+j] = src[j];
  1004c0:	88 1c 17             	mov    %bl,(%edi,%edx,1)
    for (j = 0; src[j] != '\0'; j++)
  1004c3:	83 c2 01             	add    $0x1,%edx
  1004c6:	0f b6 1c 16          	movzbl (%esi,%edx,1),%ebx
  1004ca:	84 db                	test   %bl,%bl
  1004cc:	75 f2                	jne    1004c0 <strcat+0x40>
  1004ce:	01 d1                	add    %edx,%ecx
    dest[i+j] = '\0';
  1004d0:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
    return dest;
  1004d4:	5b                   	pop    %ebx
  1004d5:	5e                   	pop    %esi
  1004d6:	5f                   	pop    %edi
  1004d7:	c3                   	ret    
  1004d8:	66 90                	xchg   %ax,%ax
  1004da:	66 90                	xchg   %ax,%ax
  1004dc:	66 90                	xchg   %ax,%ax
  1004de:	66 90                	xchg   %ax,%ax

001004e0 <kprint>:
#include "string.h"
#include "device/uart.h"
#include "kernel/console.h"

void kprint(string message)
{
  1004e0:	53                   	push   %ebx
  1004e1:	83 ec 14             	sub    $0x14,%esp
  1004e4:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    console_print(message);
  1004e8:	53                   	push   %ebx
  1004e9:	e8 12 0a 00 00       	call   100f00 <console_print>
    uart_print(COM1, message);
  1004ee:	58                   	pop    %eax
  1004ef:	5a                   	pop    %edx
  1004f0:	53                   	push   %ebx
  1004f1:	68 f8 03 00 00       	push   $0x3f8
  1004f6:	e8 65 14 00 00       	call   101960 <uart_print>
}
  1004fb:	83 c4 18             	add    $0x18,%esp
  1004fe:	5b                   	pop    %ebx
  1004ff:	c3                   	ret    

00100500 <kprintfva>:

void kprintfva(string format, va_list va)
{
  100500:	55                   	push   %ebp
  100501:	57                   	push   %edi
  100502:	31 c9                	xor    %ecx,%ecx
  100504:	56                   	push   %esi
  100505:	53                   	push   %ebx
  100506:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
  10050c:	8b 9c 24 50 04 00 00 	mov    0x450(%esp),%ebx
  100513:	8b 94 24 54 04 00 00 	mov    0x454(%esp),%edx
  10051a:	8d 74 24 30          	lea    0x30(%esp),%esi
    char buffer[1024];
    buffer[0] = '\0';
  10051e:	c6 44 24 30 00       	movb   $0x0,0x30(%esp)
  100523:	8d 7c 24 10          	lea    0x10(%esp),%edi

    bool wait_for_format = false;

    for (u32 i = 0; format[i]; i++)
  100527:	0f be 03             	movsbl (%ebx),%eax
  10052a:	83 c3 01             	add    $0x1,%ebx
  10052d:	84 c0                	test   %al,%al
  10052f:	75 23                	jne    100554 <kprintfva+0x54>
  100531:	e9 82 00 00 00       	jmp    1005b8 <kprintfva+0xb8>
  100536:	8d 76 00             	lea    0x0(%esi),%esi
  100539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
        char c = format[i];

        if (c == '%' && !wait_for_format)
  100540:	84 c9                	test   %cl,%cl
  100542:	75 14                	jne    100558 <kprintfva+0x58>
        {
            wait_for_format = true;
  100544:	b9 01 00 00 00       	mov    $0x1,%ecx
  100549:	83 c3 01             	add    $0x1,%ebx
    for (u32 i = 0; format[i]; i++)
  10054c:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  100550:	84 c0                	test   %al,%al
  100552:	74 64                	je     1005b8 <kprintfva+0xb8>
        if (c == '%' && !wait_for_format)
  100554:	3c 25                	cmp    $0x25,%al
  100556:	74 e8                	je     100540 <kprintfva+0x40>
        }
        else if (wait_for_format)
  100558:	84 c9                	test   %cl,%cl
  10055a:	0f 84 30 01 00 00    	je     100690 <kprintfva+0x190>
        {
            char temp[32];
            switch (c)
  100560:	83 e8 62             	sub    $0x62,%eax
  100563:	3c 16                	cmp    $0x16,%al
  100565:	77 44                	ja     1005ab <kprintfva+0xab>
  100567:	0f b6 c0             	movzbl %al,%eax
  10056a:	ff 24 85 00 50 10 00 	jmp    *0x105000(,%eax,4)
  100571:	eb 0d                	jmp    100580 <kprintfva+0x80>
  100573:	90                   	nop
  100574:	90                   	nop
  100575:	90                   	nop
  100576:	90                   	nop
  100577:	90                   	nop
  100578:	90                   	nop
  100579:	90                   	nop
  10057a:	90                   	nop
  10057b:	90                   	nop
  10057c:	90                   	nop
  10057d:	90                   	nop
  10057e:	90                   	nop
  10057f:	90                   	nop
                    uint_to_string(va_arg(va, u32), temp, 10);
                    strcat(buffer, temp);
                    break;

                case 'x':
                    uint_to_string(va_arg(va, u32), temp, 16);
  100580:	83 ec 04             	sub    $0x4,%esp
  100583:	8d 6a 04             	lea    0x4(%edx),%ebp
  100586:	6a 10                	push   $0x10
  100588:	57                   	push   %edi
  100589:	ff 32                	pushl  (%edx)
  10058b:	e8 30 fb ff ff       	call   1000c0 <uint_to_string>
                    strcat(buffer, "0x");
  100590:	58                   	pop    %eax
  100591:	5a                   	pop    %edx
  100592:	68 89 5f 10 00       	push   $0x105f89
  100597:	56                   	push   %esi
  100598:	e8 e3 fe ff ff       	call   100480 <strcat>
                        strcat(buffer, temp);
  10059d:	59                   	pop    %ecx
  10059e:	58                   	pop    %eax
  10059f:	57                   	push   %edi
  1005a0:	56                   	push   %esi
  1005a1:	e8 da fe ff ff       	call   100480 <strcat>
                    break;
  1005a6:	83 c4 10             	add    $0x10,%esp
                        int value = va_arg(va, u32);
  1005a9:	89 ea                	mov    %ebp,%edx
            
                default:
                    break;
            }

            wait_for_format = false;
  1005ab:	31 c9                	xor    %ecx,%ecx
  1005ad:	83 c3 01             	add    $0x1,%ebx
    for (u32 i = 0; format[i]; i++)
  1005b0:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  1005b4:	84 c0                	test   %al,%al
  1005b6:	75 9c                	jne    100554 <kprintfva+0x54>
        {
            strapd(buffer, c);
        }
    }
    
    console_print(buffer);
  1005b8:	83 ec 0c             	sub    $0xc,%esp
  1005bb:	56                   	push   %esi
  1005bc:	e8 3f 09 00 00       	call   100f00 <console_print>
    uart_print(COM1, buffer);
  1005c1:	59                   	pop    %ecx
  1005c2:	5b                   	pop    %ebx
  1005c3:	56                   	push   %esi
  1005c4:	68 f8 03 00 00       	push   $0x3f8
  1005c9:	e8 92 13 00 00       	call   101960 <uart_print>
}
  1005ce:	83 c4 10             	add    $0x10,%esp
  1005d1:	81 c4 3c 04 00 00    	add    $0x43c,%esp
  1005d7:	5b                   	pop    %ebx
  1005d8:	5e                   	pop    %esi
  1005d9:	5f                   	pop    %edi
  1005da:	5d                   	pop    %ebp
  1005db:	c3                   	ret    
  1005dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                    uint_to_string(va_arg(va, u32), temp, 10);
  1005e0:	83 ec 04             	sub    $0x4,%esp
  1005e3:	8d 6a 04             	lea    0x4(%edx),%ebp
  1005e6:	6a 0a                	push   $0xa
  1005e8:	57                   	push   %edi
  1005e9:	ff 32                	pushl  (%edx)
                        uint_to_string(uvalue, temp, 10);
  1005eb:	e8 d0 fa ff ff       	call   1000c0 <uint_to_string>
  1005f0:	eb ab                	jmp    10059d <kprintfva+0x9d>
  1005f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                    strcat(buffer, va_arg(va, string));
  100600:	83 ec 08             	sub    $0x8,%esp
  100603:	8d 6a 04             	lea    0x4(%edx),%ebp
  100606:	ff 32                	pushl  (%edx)
  100608:	56                   	push   %esi
  100609:	e8 72 fe ff ff       	call   100480 <strcat>
                    break;
  10060e:	83 c4 10             	add    $0x10,%esp
                    strcat(buffer, va_arg(va, string));
  100611:	89 ea                	mov    %ebp,%edx
            wait_for_format = false;
  100613:	31 c9                	xor    %ecx,%ecx
  100615:	eb 96                	jmp    1005ad <kprintfva+0xad>
  100617:	89 f6                	mov    %esi,%esi
  100619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                    uint_to_string(va_arg(va, u32), temp, 2);
  100620:	83 ec 04             	sub    $0x4,%esp
  100623:	8d 6a 04             	lea    0x4(%edx),%ebp
  100626:	6a 02                	push   $0x2
  100628:	57                   	push   %edi
  100629:	ff 32                	pushl  (%edx)
  10062b:	e8 90 fa ff ff       	call   1000c0 <uint_to_string>
                    strcat(buffer, "0b");
  100630:	58                   	pop    %eax
  100631:	5a                   	pop    %edx
  100632:	68 84 5f 10 00       	push   $0x105f84
  100637:	56                   	push   %esi
  100638:	e8 43 fe ff ff       	call   100480 <strcat>
  10063d:	e9 5b ff ff ff       	jmp    10059d <kprintfva+0x9d>
  100642:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                        int value = va_arg(va, u32);
  100650:	8d 6a 04             	lea    0x4(%edx),%ebp
  100653:	8b 12                	mov    (%edx),%edx
                        if (value < 0)
  100655:	85 d2                	test   %edx,%edx
  100657:	78 67                	js     1006c0 <kprintfva+0x1c0>
                        uint_to_string(uvalue, temp, 10);
  100659:	83 ec 04             	sub    $0x4,%esp
  10065c:	6a 0a                	push   $0xa
  10065e:	57                   	push   %edi
  10065f:	52                   	push   %edx
  100660:	eb 89                	jmp    1005eb <kprintfva+0xeb>
  100662:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                    strapd(buffer, va_arg(va, char));
  100670:	0f be 02             	movsbl (%edx),%eax
  100673:	83 ec 08             	sub    $0x8,%esp
  100676:	8d 6a 04             	lea    0x4(%edx),%ebp
  100679:	50                   	push   %eax
  10067a:	56                   	push   %esi
  10067b:	e8 30 fd ff ff       	call   1003b0 <strapd>
                    break;
  100680:	83 c4 10             	add    $0x10,%esp
                    strapd(buffer, va_arg(va, char));
  100683:	89 ea                	mov    %ebp,%edx
            wait_for_format = false;
  100685:	31 c9                	xor    %ecx,%ecx
  100687:	e9 21 ff ff ff       	jmp    1005ad <kprintfva+0xad>
  10068c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100690:	89 54 24 0c          	mov    %edx,0xc(%esp)
  100694:	88 4c 24 08          	mov    %cl,0x8(%esp)
            strapd(buffer, c);
  100698:	83 ec 08             	sub    $0x8,%esp
  10069b:	50                   	push   %eax
  10069c:	56                   	push   %esi
  10069d:	e8 0e fd ff ff       	call   1003b0 <strapd>
  1006a2:	83 c4 10             	add    $0x10,%esp
  1006a5:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
  1006aa:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1006ae:	e9 96 fe ff ff       	jmp    100549 <kprintfva+0x49>
  1006b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1006b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                            uvalue = 0 - value;
  1006c0:	f7 da                	neg    %edx
                            strcat(buffer, "-");
  1006c2:	83 ec 08             	sub    $0x8,%esp
                            uvalue = 0 - value;
  1006c5:	89 54 24 10          	mov    %edx,0x10(%esp)
                            strcat(buffer, "-");
  1006c9:	68 87 5f 10 00       	push   $0x105f87
  1006ce:	56                   	push   %esi
  1006cf:	e8 ac fd ff ff       	call   100480 <strcat>
  1006d4:	83 c4 10             	add    $0x10,%esp
  1006d7:	8b 54 24 08          	mov    0x8(%esp),%edx
                        uint_to_string(uvalue, temp, 10);
  1006db:	83 ec 04             	sub    $0x4,%esp
  1006de:	6a 0a                	push   $0xa
  1006e0:	57                   	push   %edi
  1006e1:	52                   	push   %edx
  1006e2:	e9 04 ff ff ff       	jmp    1005eb <kprintfva+0xeb>
  1006e7:	89 f6                	mov    %esi,%esi
  1006e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001006f0 <kprintf>:

void kprintf(string format, ...)
{
  1006f0:	83 ec 14             	sub    $0x14,%esp
    va_list va;
    va_start(va, format);

    kprintfva(format, va);
  1006f3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  1006f7:	50                   	push   %eax
  1006f8:	ff 74 24 1c          	pushl  0x1c(%esp)
  1006fc:	e8 ff fd ff ff       	call   100500 <kprintfva>
  100701:	83 c4 1c             	add    $0x1c,%esp
  100704:	c3                   	ret    
  100705:	66 90                	xchg   %ax,%ax
  100707:	66 90                	xchg   %ax,%ax
  100709:	66 90                	xchg   %ax,%ax
  10070b:	66 90                	xchg   %ax,%ax
  10070d:	66 90                	xchg   %ax,%ax
  10070f:	90                   	nop

00100710 <setup_pic>:
  return data;
}

static inline void outb(u16 port, u8 data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  100710:	ba 20 00 00 00       	mov    $0x20,%edx
  100715:	b8 11 00 00 00       	mov    $0x11,%eax
  10071a:	ee                   	out    %al,(%dx)
/* --- private functions ---------------------------------------------------- */

void setup_pic()
{
    /* Initialisation de ICW1 */
	outb(0x20, 0x11); PIC_WAIT();
  10071b:	eb 00                	jmp    10071d <setup_pic+0xd>
  10071d:	eb 00                	jmp    10071f <setup_pic+0xf>
  10071f:	ba a0 00 00 00       	mov    $0xa0,%edx
  100724:	ee                   	out    %al,(%dx)
	outb(0xA0, 0x11); PIC_WAIT();
  100725:	eb 00                	jmp    100727 <setup_pic+0x17>
  100727:	eb 00                	jmp    100729 <setup_pic+0x19>
  100729:	ba 21 00 00 00       	mov    $0x21,%edx
  10072e:	b8 20 00 00 00       	mov    $0x20,%eax
  100733:	ee                   	out    %al,(%dx)

	/* Initialisation de ICW2 */
	outb(0x21, 0x20); PIC_WAIT();	/* vecteur de depart = 32 */
  100734:	eb 00                	jmp    100736 <setup_pic+0x26>
  100736:	eb 00                	jmp    100738 <setup_pic+0x28>
  100738:	ba a1 00 00 00       	mov    $0xa1,%edx
  10073d:	b8 70 00 00 00       	mov    $0x70,%eax
  100742:	ee                   	out    %al,(%dx)
	outb(0xA1, 0x70); PIC_WAIT();	/* vecteur de depart = 96 */
  100743:	eb 00                	jmp    100745 <setup_pic+0x35>
  100745:	eb 00                	jmp    100747 <setup_pic+0x37>
  100747:	ba 21 00 00 00       	mov    $0x21,%edx
  10074c:	b8 04 00 00 00       	mov    $0x4,%eax
  100751:	ee                   	out    %al,(%dx)

	/* Initialisation de ICW3 */
	outb(0x21, 0x04); PIC_WAIT();
  100752:	eb 00                	jmp    100754 <setup_pic+0x44>
  100754:	eb 00                	jmp    100756 <setup_pic+0x46>
  100756:	ba a1 00 00 00       	mov    $0xa1,%edx
  10075b:	b8 02 00 00 00       	mov    $0x2,%eax
  100760:	ee                   	out    %al,(%dx)
	outb(0xA1, 0x02); PIC_WAIT();
  100761:	eb 00                	jmp    100763 <setup_pic+0x53>
  100763:	eb 00                	jmp    100765 <setup_pic+0x55>
  100765:	ba 21 00 00 00       	mov    $0x21,%edx
  10076a:	b8 01 00 00 00       	mov    $0x1,%eax
  10076f:	ee                   	out    %al,(%dx)

	/* Initialisation de ICW4 */
	outb(0x21, 0x01); PIC_WAIT();
  100770:	eb 00                	jmp    100772 <setup_pic+0x62>
  100772:	eb 00                	jmp    100774 <setup_pic+0x64>
  100774:	ba a1 00 00 00       	mov    $0xa1,%edx
  100779:	ee                   	out    %al,(%dx)
	outb(0xA1, 0x01); PIC_WAIT();
  10077a:	eb 00                	jmp    10077c <setup_pic+0x6c>
  10077c:	eb 00                	jmp    10077e <setup_pic+0x6e>
  10077e:	ba 21 00 00 00       	mov    $0x21,%edx
  100783:	31 c0                	xor    %eax,%eax
  100785:	ee                   	out    %al,(%dx)

	/* masquage des interruptions */
	outb(0x21, 0x0);  PIC_WAIT();
  100786:	eb 00                	jmp    100788 <setup_pic+0x78>
  100788:	eb 00                	jmp    10078a <setup_pic+0x7a>
  10078a:	ba a1 00 00 00       	mov    $0xa1,%edx
  10078f:	ee                   	out    %al,(%dx)
	outb(0xA1, 0x0);  PIC_WAIT();
  100790:	eb 00                	jmp    100792 <setup_pic+0x82>
  100792:	eb 00                	jmp    100794 <setup_pic+0x84>
  100794:	c3                   	ret    
  100795:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001007a0 <init_idt_entry>:
}

void init_idt_entry(idt_entry_t * entry, u16 selector, u32 offset, u16 type)
{
  1007a0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1007a4:	8b 54 24 0c          	mov    0xc(%esp),%edx
	entry->offset0_15 = (offset & 0xffff);
  1007a8:	66 89 10             	mov    %dx,(%eax)
	entry->select = selector;
  1007ab:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	entry->type = type;
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  1007af:	c1 ea 10             	shr    $0x10,%edx
	entry->select = selector;
  1007b2:	66 89 48 02          	mov    %cx,0x2(%eax)
	entry->type = type;
  1007b6:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  1007ba:	66 89 50 06          	mov    %dx,0x6(%eax)
	entry->type = type;
  1007be:	66 89 48 04          	mov    %cx,0x4(%eax)
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  1007c2:	c3                   	ret    
  1007c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1007c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001007d0 <interrupt_handler>:
	return;
}

void interrupt_handler(registry_t reg)
{
  1007d0:	83 ec 0c             	sub    $0xc,%esp
    INFO("interrupt %d!", reg.int_no);
  1007d3:	ff 74 24 10          	pushl  0x10(%esp)
  1007d7:	68 c1 5f 10 00       	push   $0x105fc1
  1007dc:	68 60 50 10 00       	push   $0x105060
  1007e1:	6a 00                	push   $0x0
  1007e3:	e8 e8 04 00 00       	call   100cd0 <__log>

    if (handlers[reg.int_no] != NULL)
  1007e8:	8b 44 24 20          	mov    0x20(%esp),%eax
  1007ec:	83 c4 10             	add    $0x10,%esp
  1007ef:	8b 14 85 20 80 10 00 	mov    0x108020(,%eax,4),%edx
  1007f6:	85 d2                	test   %edx,%edx
  1007f8:	74 26                	je     100820 <interrupt_handler+0x50>
    {
        handlers[reg.int_no](&reg);
  1007fa:	83 ec 0c             	sub    $0xc,%esp
  1007fd:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  100801:	50                   	push   %eax
  100802:	ff d2                	call   *%edx
  100804:	83 c4 10             	add    $0x10,%esp
  100807:	ba 20 00 00 00       	mov    $0x20,%edx
  10080c:	b8 20 00 00 00       	mov    $0x20,%eax
  100811:	ee                   	out    %al,(%dx)
        
        WARN("Unhandeled interrupt %d!", reg.int_no);
    }

    outb(0x20, 0x20);
}
  100812:	83 c4 0c             	add    $0xc,%esp
  100815:	c3                   	ret    
  100816:	8d 76 00             	lea    0x0(%esi),%esi
  100819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    else if (reg.int_no < 32)
  100820:	83 f8 1f             	cmp    $0x1f,%eax
  100823:	76 1b                	jbe    100840 <interrupt_handler+0x70>
        WARN("Unhandeled interrupt %d!", reg.int_no);
  100825:	50                   	push   %eax
  100826:	68 b6 5f 10 00       	push   $0x105fb6
  10082b:	68 60 50 10 00       	push   $0x105060
  100830:	6a 01                	push   $0x1
  100832:	e8 99 04 00 00       	call   100cd0 <__log>
  100837:	83 c4 10             	add    $0x10,%esp
  10083a:	eb cb                	jmp    100807 <interrupt_handler+0x37>
  10083c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        PANIC_REG(reg, "&5Exception (%d) : %s!&f", reg.int_no, exception_messages[reg.int_no]);
  100840:	83 ec 04             	sub    $0x4,%esp
  100843:	ff 34 85 80 50 10 00 	pushl  0x105080(,%eax,4)
  10084a:	50                   	push   %eax
  10084b:	68 8c 5f 10 00       	push   $0x105f8c
  100850:	6a 5b                	push   $0x5b
  100852:	68 60 50 10 00       	push   $0x105060
  100857:	68 a5 5f 10 00       	push   $0x105fa5
  10085c:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  100860:	50                   	push   %eax
  100861:	e8 3a 05 00 00       	call   100da0 <__panic>
  100866:	83 c4 20             	add    $0x20,%esp
  100869:	eb 9c                	jmp    100807 <interrupt_handler+0x37>
  10086b:	90                   	nop
  10086c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100870 <install_interrupts>:

/* --- public functions ----------------------------------------------------- */

bool install_interrupts()
{
  100870:	83 ec 0c             	sub    $0xc,%esp
    setup_pic();
  100873:	e8 98 fe ff ff       	call   100710 <setup_pic>

    memset((void *)&handlers, 0, IDTSIZE * sizeof(interrupt_handler_t));
  100878:	83 ec 04             	sub    $0x4,%esp
  10087b:	68 fc 03 00 00       	push   $0x3fc
  100880:	6a 00                	push   $0x0
  100882:	68 20 80 10 00       	push   $0x108020
  100887:	e8 64 f9 ff ff       	call   1001f0 <memset>
    memset((void *)&entries, 0, IDTSIZE * sizeof(idt_entry_t));
  10088c:	83 c4 0c             	add    $0xc,%esp
  10088f:	68 f8 07 00 00       	push   $0x7f8
  100894:	6a 00                	push   $0x0
  100896:	68 20 84 10 00       	push   $0x108420
  10089b:	e8 50 f9 ff ff       	call   1001f0 <memset>
  1008a0:	83 c4 10             	add    $0x10,%esp
  1008a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1008a8:	eb 09                	jmp    1008b3 <install_interrupts+0x43>
  1008aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1008b0:	83 c0 01             	add    $0x1,%eax

    for(u32 i = 0; i < IDTSIZE; i++)
    {
        if (i == 30)
  1008b3:	83 f8 1f             	cmp    $0x1f,%eax
  1008b6:	74 61                	je     100919 <install_interrupts+0xa9>
        {
            init_idt_entry(&entries[i], 0x08, int_handlers[i], 0xEF00);
        }
        else
        {
            init_idt_entry(&entries[i], 0x08, int_handlers[i], INTGATE);
  1008b8:	8b 14 85 a8 71 10 00 	mov    0x1071a8(,%eax,4),%edx
	entry->select = selector;
  1008bf:	b9 08 00 00 00       	mov    $0x8,%ecx
  1008c4:	66 89 0c c5 1a 84 10 	mov    %cx,0x10841a(,%eax,8)
  1008cb:	00 
	entry->type = type;
  1008cc:	b9 00 8e ff ff       	mov    $0xffff8e00,%ecx
  1008d1:	66 89 0c c5 1c 84 10 	mov    %cx,0x10841c(,%eax,8)
  1008d8:	00 
	entry->offset0_15 = (offset & 0xffff);
  1008d9:	66 89 14 c5 18 84 10 	mov    %dx,0x108418(,%eax,8)
  1008e0:	00 
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  1008e1:	c1 ea 10             	shr    $0x10,%edx
    for(u32 i = 0; i < IDTSIZE; i++)
  1008e4:	3d ff 00 00 00       	cmp    $0xff,%eax
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  1008e9:	66 89 14 c5 1e 84 10 	mov    %dx,0x10841e(,%eax,8)
  1008f0:	00 
    for(u32 i = 0; i < IDTSIZE; i++)
  1008f1:	75 bd                	jne    1008b0 <install_interrupts+0x40>
        }
    }
    
    registry.limite = (sizeof(idt_entry_t) * IDTSIZE);
  1008f3:	b8 f8 07 00 00       	mov    $0x7f8,%eax
    registry.base   = (u32)&entries;
  1008f8:	c7 05 02 80 10 00 20 	movl   $0x108420,0x108002
  1008ff:	84 10 00 
    registry.limite = (sizeof(idt_entry_t) * IDTSIZE);
  100902:	66 a3 00 80 10 00    	mov    %ax,0x108000
    
    asm("lidtl (registry)");
  100908:	0f 01 1d 00 80 10 00 	lidtl  0x108000
}

static inline void sti(void)
{
  asm volatile("sti");
  10090f:	fb                   	sti    

    sti();

    return true;
}
  100910:	b8 01 00 00 00       	mov    $0x1,%eax
  100915:	83 c4 0c             	add    $0xc,%esp
  100918:	c3                   	ret    
            init_idt_entry(&entries[i], 0x08, int_handlers[i], 0xEF00);
  100919:	8b 15 24 72 10 00    	mov    0x107224,%edx
	entry->select = selector;
  10091f:	b9 08 00 00 00       	mov    $0x8,%ecx
  100924:	66 89 0d 12 85 10 00 	mov    %cx,0x108512
	entry->type = type;
  10092b:	b9 00 ef ff ff       	mov    $0xffffef00,%ecx
  100930:	66 89 0d 14 85 10 00 	mov    %cx,0x108514
	entry->offset0_15 = (offset & 0xffff);
  100937:	66 89 15 10 85 10 00 	mov    %dx,0x108510
	entry->offset16_31 = (offset & 0xffff0000) >> 16;
  10093e:	c1 ea 10             	shr    $0x10,%edx
  100941:	66 89 15 16 85 10 00 	mov    %dx,0x108516
  100948:	e9 63 ff ff ff       	jmp    1008b0 <install_interrupts+0x40>
  10094d:	8d 76 00             	lea    0x0(%esi),%esi

00100950 <add_interrupts_handler>:

void add_interrupts_handler(int interrupt, interrupt_handler_t handler)
{
    handlers[interrupt] = handler;
  100950:	8b 54 24 08          	mov    0x8(%esp),%edx
  100954:	8b 44 24 04          	mov    0x4(%esp),%eax
  100958:	89 14 85 20 80 10 00 	mov    %edx,0x108020(,%eax,4)
  10095f:	c3                   	ret    

00100960 <install_gdt>:
gdt_entry_t    gdt[GDTSIZE];
gdt_registry_t gdt_registry;
tss_t default_tss;

bool install_gdt()
{
  100960:	53                   	push   %ebx
    // Clear the gdt.
    memset((void *)&gdt, 0, sizeof(gdt_entry_t)  * GDTSIZE);
    memset((void *)&default_tss, 0, sizeof(tss_t));

    //setup the tss.
    default_tss.debug_flag = 0x00;
  100961:	bb 40 94 10 00       	mov    $0x109440,%ebx
{
  100966:	83 ec 0c             	sub    $0xc,%esp
    memset((void *)&gdt, 0, sizeof(gdt_entry_t)  * GDTSIZE);
  100969:	68 f8 07 00 00       	push   $0x7f8
  10096e:	6a 00                	push   $0x0
  100970:	68 40 8c 10 00       	push   $0x108c40
  100975:	e8 76 f8 ff ff       	call   1001f0 <memset>
    memset((void *)&default_tss, 0, sizeof(tss_t));
  10097a:	83 c4 0c             	add    $0xc,%esp
  10097d:	6a 68                	push   $0x68
  10097f:	6a 00                	push   $0x0
  100981:	68 40 94 10 00       	push   $0x109440
  100986:	e8 65 f8 ff ff       	call   1001f0 <memset>
    default_tss.debug_flag = 0x00;
  10098b:	31 c0                	xor    %eax,%eax
	default_tss.io_map = 0x00;
  10098d:	31 d2                	xor    %edx,%edx
	default_tss.esp0 = 0x20000;
	default_tss.ss0 = 0x18;
  10098f:	b9 18 00 00 00       	mov    $0x18,%ecx
    default_tss.debug_flag = 0x00;
  100994:	66 a3 a4 94 10 00    	mov    %ax,0x1094a4
    return true;
}

void init_gdt_entry(gdt_entry_t * entry, u32 base, u32 limite, u8 acces, u8 flags)
{
    entry->lim0_15  = (limite &  0xffff);
  10099a:	31 c0                	xor    %eax,%eax
	default_tss.io_map = 0x00;
  10099c:	66 89 15 a6 94 10 00 	mov    %dx,0x1094a6
    entry->lim0_15  = (limite &  0xffff);
  1009a3:	66 a3 40 8c 10 00    	mov    %ax,0x108c40
    entry->lim16_19 = (limite & 0xf0000) >> 16;

    entry->base0_15  = (base &     0xffff);
  1009a9:	31 c0                	xor    %eax,%eax
	default_tss.ss0 = 0x18;
  1009ab:	66 89 0d 48 94 10 00 	mov    %cx,0x109448
    entry->base0_15  = (base &     0xffff);
  1009b2:	66 a3 42 8c 10 00    	mov    %ax,0x108c42
	default_tss.esp0 = 0x20000;
  1009b8:	c7 05 44 94 10 00 00 	movl   $0x20000,0x109444
  1009bf:	00 02 00 
    entry->base24_31 = (base & 0xff000000) >> 24;

    entry->acces = acces;
    entry->flags = flags;

    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  1009c2:	58                   	pop    %eax
  1009c3:	5a                   	pop    %edx
  1009c4:	6a 00                	push   $0x0
  1009c6:	6a 00                	push   $0x0
  1009c8:	6a 00                	push   $0x0
  1009ca:	6a 00                	push   $0x0
  1009cc:	6a 00                	push   $0x0
  1009ce:	68 9c 51 10 00       	push   $0x10519c
    entry->base16_23 = (base &   0xff0000) >> 16;
  1009d3:	c6 05 44 8c 10 00 00 	movb   $0x0,0x108c44
    entry->base24_31 = (base & 0xff000000) >> 24;
  1009da:	c6 05 47 8c 10 00 00 	movb   $0x0,0x108c47
    entry->acces = acces;
  1009e1:	c6 05 45 8c 10 00 00 	movb   $0x0,0x108c45
    entry->flags = flags;
  1009e8:	c6 05 46 8c 10 00 00 	movb   $0x0,0x108c46
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  1009ef:	e8 fc fc ff ff       	call   1006f0 <kprintf>
  1009f4:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  1009f7:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    entry->base0_15  = (base &     0xffff);
  1009fc:	31 c0                	xor    %eax,%eax
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  1009fe:	6a 0d                	push   $0xd
  100a00:	68 9b 00 00 00       	push   $0x9b
  100a05:	6a ff                	push   $0xffffffff
  100a07:	6a 00                	push   $0x0
  100a09:	6a 01                	push   $0x1
  100a0b:	68 9c 51 10 00       	push   $0x10519c
    entry->lim0_15  = (limite &  0xffff);
  100a10:	66 89 0d 48 8c 10 00 	mov    %cx,0x108c48
    entry->base0_15  = (base &     0xffff);
  100a17:	66 a3 4a 8c 10 00    	mov    %ax,0x108c4a
    entry->base16_23 = (base &   0xff0000) >> 16;
  100a1d:	c6 05 4c 8c 10 00 00 	movb   $0x0,0x108c4c
    entry->base24_31 = (base & 0xff000000) >> 24;
  100a24:	c6 05 4f 8c 10 00 00 	movb   $0x0,0x108c4f
    entry->acces = acces;
  100a2b:	c6 05 4d 8c 10 00 9b 	movb   $0x9b,0x108c4d
    entry->flags = flags;
  100a32:	c6 05 4e 8c 10 00 df 	movb   $0xdf,0x108c4e
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100a39:	e8 b2 fc ff ff       	call   1006f0 <kprintf>
  100a3e:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  100a41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    entry->base16_23 = (base &   0xff0000) >> 16;
  100a46:	c6 05 54 8c 10 00 00 	movb   $0x0,0x108c54
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100a4d:	6a 0d                	push   $0xd
  100a4f:	68 93 00 00 00       	push   $0x93
  100a54:	6a ff                	push   $0xffffffff
  100a56:	6a 00                	push   $0x0
  100a58:	6a 02                	push   $0x2
  100a5a:	68 9c 51 10 00       	push   $0x10519c
    entry->lim0_15  = (limite &  0xffff);
  100a5f:	66 a3 50 8c 10 00    	mov    %ax,0x108c50
    entry->base0_15  = (base &     0xffff);
  100a65:	31 c0                	xor    %eax,%eax
    entry->base24_31 = (base & 0xff000000) >> 24;
  100a67:	c6 05 57 8c 10 00 00 	movb   $0x0,0x108c57
    entry->base0_15  = (base &     0xffff);
  100a6e:	66 a3 52 8c 10 00    	mov    %ax,0x108c52
    entry->acces = acces;
  100a74:	c6 05 55 8c 10 00 93 	movb   $0x93,0x108c55
    entry->flags = flags;
  100a7b:	c6 05 56 8c 10 00 df 	movb   $0xdf,0x108c56
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100a82:	e8 69 fc ff ff       	call   1006f0 <kprintf>
  100a87:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  100a8a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    entry->base16_23 = (base &   0xff0000) >> 16;
  100a8f:	c6 05 5c 8c 10 00 00 	movb   $0x0,0x108c5c
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100a96:	6a 0d                	push   $0xd
  100a98:	68 97 00 00 00       	push   $0x97
  100a9d:	6a ff                	push   $0xffffffff
  100a9f:	6a 00                	push   $0x0
  100aa1:	6a 03                	push   $0x3
  100aa3:	68 9c 51 10 00       	push   $0x10519c
    entry->lim0_15  = (limite &  0xffff);
  100aa8:	66 a3 58 8c 10 00    	mov    %ax,0x108c58
    entry->base0_15  = (base &     0xffff);
  100aae:	31 c0                	xor    %eax,%eax
    entry->base24_31 = (base & 0xff000000) >> 24;
  100ab0:	c6 05 5f 8c 10 00 00 	movb   $0x0,0x108c5f
    entry->base0_15  = (base &     0xffff);
  100ab7:	66 a3 5a 8c 10 00    	mov    %ax,0x108c5a
    entry->acces = acces;
  100abd:	c6 05 5d 8c 10 00 97 	movb   $0x97,0x108c5d
    entry->flags = flags;
  100ac4:	c6 05 5e 8c 10 00 df 	movb   $0xdf,0x108c5e
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100acb:	e8 20 fc ff ff       	call   1006f0 <kprintf>
  100ad0:	83 c4 18             	add    $0x18,%esp
    entry->base0_15  = (base &     0xffff);
  100ad3:	31 d2                	xor    %edx,%edx
    entry->lim0_15  = (limite &  0xffff);
  100ad5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100ada:	6a 0d                	push   $0xd
  100adc:	68 ff 00 00 00       	push   $0xff
  100ae1:	6a ff                	push   $0xffffffff
  100ae3:	68 00 00 03 00       	push   $0x30000
  100ae8:	6a 04                	push   $0x4
  100aea:	68 9c 51 10 00       	push   $0x10519c
    entry->base0_15  = (base &     0xffff);
  100aef:	66 89 15 62 8c 10 00 	mov    %dx,0x108c62
    entry->lim0_15  = (limite &  0xffff);
  100af6:	66 a3 60 8c 10 00    	mov    %ax,0x108c60
    entry->base16_23 = (base &   0xff0000) >> 16;
  100afc:	c6 05 64 8c 10 00 03 	movb   $0x3,0x108c64
    entry->base24_31 = (base & 0xff000000) >> 24;
  100b03:	c6 05 67 8c 10 00 00 	movb   $0x0,0x108c67
    entry->acces = acces;
  100b0a:	c6 05 65 8c 10 00 ff 	movb   $0xff,0x108c65
    entry->flags = flags;
  100b11:	c6 05 66 8c 10 00 df 	movb   $0xdf,0x108c66
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100b18:	e8 d3 fb ff ff       	call   1006f0 <kprintf>
  100b1d:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  100b20:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    entry->base0_15  = (base &     0xffff);
  100b25:	31 c0                	xor    %eax,%eax
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100b27:	6a 0d                	push   $0xd
  100b29:	68 f3 00 00 00       	push   $0xf3
  100b2e:	6a ff                	push   $0xffffffff
  100b30:	68 00 00 03 00       	push   $0x30000
  100b35:	6a 05                	push   $0x5
  100b37:	68 9c 51 10 00       	push   $0x10519c
    entry->lim0_15  = (limite &  0xffff);
  100b3c:	66 89 0d 68 8c 10 00 	mov    %cx,0x108c68
    entry->base0_15  = (base &     0xffff);
  100b43:	66 a3 6a 8c 10 00    	mov    %ax,0x108c6a
    entry->base16_23 = (base &   0xff0000) >> 16;
  100b49:	c6 05 6c 8c 10 00 03 	movb   $0x3,0x108c6c
    entry->base24_31 = (base & 0xff000000) >> 24;
  100b50:	c6 05 6f 8c 10 00 00 	movb   $0x0,0x108c6f
    entry->acces = acces;
  100b57:	c6 05 6d 8c 10 00 f3 	movb   $0xf3,0x108c6d
    entry->flags = flags;
  100b5e:	c6 05 6e 8c 10 00 df 	movb   $0xdf,0x108c6e
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100b65:	e8 86 fb ff ff       	call   1006f0 <kprintf>
  100b6a:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  100b6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    entry->base16_23 = (base &   0xff0000) >> 16;
  100b72:	c6 05 74 8c 10 00 03 	movb   $0x3,0x108c74
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100b79:	6a 0d                	push   $0xd
  100b7b:	68 f7 00 00 00       	push   $0xf7
  100b80:	6a ff                	push   $0xffffffff
  100b82:	68 00 00 03 00       	push   $0x30000
  100b87:	6a 06                	push   $0x6
  100b89:	68 9c 51 10 00       	push   $0x10519c
    entry->lim0_15  = (limite &  0xffff);
  100b8e:	66 a3 70 8c 10 00    	mov    %ax,0x108c70
    entry->base0_15  = (base &     0xffff);
  100b94:	31 c0                	xor    %eax,%eax
    entry->base24_31 = (base & 0xff000000) >> 24;
  100b96:	c6 05 77 8c 10 00 00 	movb   $0x0,0x108c77
    entry->base0_15  = (base &     0xffff);
  100b9d:	66 a3 72 8c 10 00    	mov    %ax,0x108c72
    entry->acces = acces;
  100ba3:	c6 05 75 8c 10 00 f7 	movb   $0xf7,0x108c75
    entry->flags = flags;
  100baa:	c6 05 76 8c 10 00 df 	movb   $0xdf,0x108c76
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100bb1:	e8 3a fb ff ff       	call   1006f0 <kprintf>
  100bb6:	83 c4 18             	add    $0x18,%esp
    entry->lim0_15  = (limite &  0xffff);
  100bb9:	b8 68 00 00 00       	mov    $0x68,%eax
    entry->base0_15  = (base &     0xffff);
  100bbe:	66 89 1d 7a 8c 10 00 	mov    %bx,0x108c7a
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100bc5:	6a 00                	push   $0x0
    entry->lim0_15  = (limite &  0xffff);
  100bc7:	66 a3 78 8c 10 00    	mov    %ax,0x108c78
    entry->base16_23 = (base &   0xff0000) >> 16;
  100bcd:	89 d8                	mov    %ebx,%eax
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100bcf:	68 e9 00 00 00       	push   $0xe9
  100bd4:	6a 68                	push   $0x68
    entry->base16_23 = (base &   0xff0000) >> 16;
  100bd6:	c1 e8 10             	shr    $0x10,%eax
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100bd9:	68 40 94 10 00       	push   $0x109440
  100bde:	6a 07                	push   $0x7
    entry->base24_31 = (base & 0xff000000) >> 24;
  100be0:	c1 eb 18             	shr    $0x18,%ebx
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100be3:	68 9c 51 10 00       	push   $0x10519c
    entry->base16_23 = (base &   0xff0000) >> 16;
  100be8:	a2 7c 8c 10 00       	mov    %al,0x108c7c
    entry->base24_31 = (base & 0xff000000) >> 24;
  100bed:	88 1d 7f 8c 10 00    	mov    %bl,0x108c7f
    entry->acces = acces;
  100bf3:	c6 05 7d 8c 10 00 e9 	movb   $0xe9,0x108c7d
    entry->flags = flags;
  100bfa:	c6 05 7e 8c 10 00 00 	movb   $0x0,0x108c7e
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100c01:	e8 ea fa ff ff       	call   1006f0 <kprintf>
    gdt_registry.limite = (sizeof(gdt_entry_t) * GDTSIZE) - 1;
  100c06:	b8 f7 07 00 00       	mov    $0x7f7,%eax
    gdt_registry.base   = (u32)&gdt;
  100c0b:	c7 05 22 8c 10 00 40 	movl   $0x108c40,0x108c22
  100c12:	8c 10 00 
    gdt_registry.limite = (sizeof(gdt_entry_t) * GDTSIZE) - 1;
  100c15:	66 a3 20 8c 10 00    	mov    %ax,0x108c20
    asm("lgdtl (gdt_registry)");
  100c1b:	0f 01 15 20 8c 10 00 	lgdtl  0x108c20
    asm("movw $0x10, %ax \n \
  100c22:	66 b8 10 00          	mov    $0x10,%ax
  100c26:	8e d8                	mov    %eax,%ds
  100c28:	8e c0                	mov    %eax,%es
  100c2a:	8e e0                	mov    %eax,%fs
  100c2c:	8e e8                	mov    %eax,%gs
  100c2e:	ea 35 0c 10 00 08 00 	ljmp   $0x8,$0x100c35

00100c35 <next>:
    asm("	movw $0x38, %ax \n \
  100c35:	66 b8 38 00          	mov    $0x38,%ax
  100c39:	0f 00 d8             	ltr    %ax
}
  100c3c:	83 c4 28             	add    $0x28,%esp
  100c3f:	b8 01 00 00 00       	mov    $0x1,%eax
  100c44:	5b                   	pop    %ebx
  100c45:	c3                   	ret    
  100c46:	8d 76 00             	lea    0x0(%esi),%esi
  100c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100c50 <init_gdt_entry>:
{
  100c50:	55                   	push   %ebp
  100c51:	57                   	push   %edi
  100c52:	56                   	push   %esi
  100c53:	53                   	push   %ebx
  100c54:	83 ec 14             	sub    $0x14,%esp
  100c57:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
  100c5b:	8b 74 24 30          	mov    0x30(%esp),%esi
  100c5f:	8b 44 24 28          	mov    0x28(%esp),%eax
  100c63:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    entry->lim16_19 = (limite & 0xf0000) >> 16;
  100c67:	89 f2                	mov    %esi,%edx
    entry->base16_23 = (base &   0xff0000) >> 16;
  100c69:	89 df                	mov    %ebx,%edi
    entry->lim16_19 = (limite & 0xf0000) >> 16;
  100c6b:	c1 ea 10             	shr    $0x10,%edx
    entry->base16_23 = (base &   0xff0000) >> 16;
  100c6e:	c1 ef 10             	shr    $0x10,%edi
    entry->lim0_15  = (limite &  0xffff);
  100c71:	66 89 30             	mov    %si,(%eax)
    entry->lim16_19 = (limite & 0xf0000) >> 16;
  100c74:	89 d5                	mov    %edx,%ebp
    entry->base16_23 = (base &   0xff0000) >> 16;
  100c76:	89 fa                	mov    %edi,%edx
    entry->base24_31 = (base & 0xff000000) >> 24;
  100c78:	89 df                	mov    %ebx,%edi
  100c7a:	c1 ef 18             	shr    $0x18,%edi
    entry->base16_23 = (base &   0xff0000) >> 16;
  100c7d:	88 50 04             	mov    %dl,0x4(%eax)
    entry->base0_15  = (base &     0xffff);
  100c80:	66 89 58 02          	mov    %bx,0x2(%eax)
    entry->base24_31 = (base & 0xff000000) >> 24;
  100c84:	89 fa                	mov    %edi,%edx
    entry->flags = flags;
  100c86:	0f b6 7c 24 38       	movzbl 0x38(%esp),%edi
    entry->acces = acces;
  100c8b:	88 48 05             	mov    %cl,0x5(%eax)
    entry->base24_31 = (base & 0xff000000) >> 24;
  100c8e:	88 50 07             	mov    %dl,0x7(%eax)
    entry->flags = flags;
  100c91:	89 ea                	mov    %ebp,%edx
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100c93:	0f b6 c9             	movzbl %cl,%ecx
    entry->flags = flags;
  100c96:	83 e2 0f             	and    $0xf,%edx
  100c99:	c1 e7 04             	shl    $0x4,%edi
  100c9c:	09 fa                	or     %edi,%edx
  100c9e:	88 50 06             	mov    %dl,0x6(%eax)
    kprintf("gdt[%d] = { base:%d, limite:%x, acces:%x, flags:%x }\n", ((s32)entry - (s32)&gdt) / sizeof(gdt_entry_t), base, limite, acces, flags);
  100ca1:	0f b6 54 24 38       	movzbl 0x38(%esp),%edx
  100ca6:	2d 40 8c 10 00       	sub    $0x108c40,%eax
  100cab:	c1 e8 03             	shr    $0x3,%eax
  100cae:	52                   	push   %edx
  100caf:	51                   	push   %ecx
  100cb0:	56                   	push   %esi
  100cb1:	53                   	push   %ebx
  100cb2:	50                   	push   %eax
  100cb3:	68 9c 51 10 00       	push   $0x10519c
  100cb8:	e8 33 fa ff ff       	call   1006f0 <kprintf>
  100cbd:	83 c4 2c             	add    $0x2c,%esp
  100cc0:	5b                   	pop    %ebx
  100cc1:	5e                   	pop    %esi
  100cc2:	5f                   	pop    %edi
  100cc3:	5d                   	pop    %ebp
  100cc4:	c3                   	ret    
  100cc5:	66 90                	xchg   %ax,%ax
  100cc7:	66 90                	xchg   %ax,%ax
  100cc9:	66 90                	xchg   %ax,%ax
  100ccb:	66 90                	xchg   %ax,%ax
  100ccd:	66 90                	xchg   %ax,%ax
  100ccf:	90                   	nop

00100cd0 <__log>:
};

const char * const log_level[] = { "&9info", "&ewarning", "&4error" };

void __log(u8 level, const string function, string message, ...)
{
  100cd0:	57                   	push   %edi
  100cd1:	56                   	push   %esi
  100cd2:	53                   	push   %ebx
  100cd3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
}

static inline void cli(void)
{
  asm volatile("cli");
  100cd7:	fa                   	cli    
    cli();

    va_list va;
    va_start(va, message);

    kprintf("&3%d:%d:%d ", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
  100cd8:	83 ec 0c             	sub    $0xc,%esp
    kprintf("&9%s &e%s&f() ", log_level[level], function); 
  100cdb:	0f b6 db             	movzbl %bl,%ebx
    kprintf("&3%d:%d:%d ", time_get(TIME_HOUR), time_get(TIME_MINUTE), time_get(TIME_SECOND));
  100cde:	6a 00                	push   $0x0
  100ce0:	e8 bb 04 00 00       	call   1011a0 <time_get>
  100ce5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  100cec:	89 c7                	mov    %eax,%edi
  100cee:	e8 ad 04 00 00       	call   1011a0 <time_get>
  100cf3:	89 c6                	mov    %eax,%esi
  100cf5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100cfc:	e8 9f 04 00 00       	call   1011a0 <time_get>
  100d01:	57                   	push   %edi
  100d02:	56                   	push   %esi
  100d03:	50                   	push   %eax
  100d04:	68 06 61 10 00       	push   $0x106106
  100d09:	e8 e2 f9 ff ff       	call   1006f0 <kprintf>
    kprintf("&9%s &e%s&f() ", log_level[level], function); 
  100d0e:	83 c4 1c             	add    $0x1c,%esp
  100d11:	ff 74 24 18          	pushl  0x18(%esp)
  100d15:	ff 34 9d 00 51 10 00 	pushl  0x105100(,%ebx,4)
  100d1c:	68 12 61 10 00       	push   $0x106112
  100d21:	e8 ca f9 ff ff       	call   1006f0 <kprintf>
    kprintfva(message, va);
  100d26:	58                   	pop    %eax
  100d27:	5a                   	pop    %edx
  100d28:	8d 44 24 24          	lea    0x24(%esp),%eax
  100d2c:	50                   	push   %eax
  100d2d:	ff 74 24 24          	pushl  0x24(%esp)
  100d31:	e8 ca f7 ff ff       	call   100500 <kprintfva>
    kprint("\n");
  100d36:	c7 04 24 53 61 10 00 	movl   $0x106153,(%esp)
  100d3d:	e8 9e f7 ff ff       	call   1004e0 <kprint>
  asm volatile("sti");
  100d42:	fb                   	sti    

    sti();
}
  100d43:	83 c4 10             	add    $0x10,%esp
  100d46:	5b                   	pop    %ebx
  100d47:	5e                   	pop    %esi
  100d48:	5f                   	pop    %edi
  100d49:	c3                   	ret    
  100d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100d50 <__assert>:

void __assert(const string file, const int line ,bool sucess, string assert)
{
  100d50:	83 ec 0c             	sub    $0xc,%esp
    
    if (!sucess)
  100d53:	80 7c 24 18 00       	cmpb   $0x0,0x18(%esp)
  100d58:	74 04                	je     100d5e <__assert+0xe>
        kprintf("&4[ASSERT FAILED]&f at %s:%d -> ", file, line);           
        kprintf(assert); kprintf("\n"); 
        
        for(;;){hlt();};  
    }
}
  100d5a:	83 c4 0c             	add    $0xc,%esp
  100d5d:	c3                   	ret    
  asm volatile("cli");
  100d5e:	fa                   	cli    
        kprintf("&4[ASSERT FAILED]&f at %s:%d -> ", file, line);           
  100d5f:	83 ec 04             	sub    $0x4,%esp
  100d62:	ff 74 24 18          	pushl  0x18(%esp)
  100d66:	ff 74 24 18          	pushl  0x18(%esp)
  100d6a:	68 d4 51 10 00       	push   $0x1051d4
  100d6f:	e8 7c f9 ff ff       	call   1006f0 <kprintf>
        kprintf(assert); kprintf("\n"); 
  100d74:	58                   	pop    %eax
  100d75:	ff 74 24 28          	pushl  0x28(%esp)
  100d79:	e8 72 f9 ff ff       	call   1006f0 <kprintf>
  100d7e:	c7 04 24 53 61 10 00 	movl   $0x106153,(%esp)
  100d85:	e8 66 f9 ff ff       	call   1006f0 <kprintf>
  100d8a:	83 c4 10             	add    $0x10,%esp
  100d8d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void hlt(void)
{
  asm volatile("hlt");
  100d90:	f4                   	hlt    
  100d91:	eb fd                	jmp    100d90 <__assert+0x40>
  100d93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100da0 <__panic>:

void __panic(registry_t * reg, const string file, const string function, const int line, string message, ...)
{
  100da0:	53                   	push   %ebx
  100da1:	83 ec 14             	sub    $0x14,%esp
  100da4:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  asm volatile("cli");
  100da8:	fa                   	cli    
    cli();

    va_list va;
    va_start(va, message);
    
    kprintf("\n&8--- &4!!!&8 ------------------------------------------------------------------------&f");
  100da9:	68 f8 51 10 00       	push   $0x1051f8
  100dae:	e8 3d f9 ff ff       	call   1006f0 <kprintf>
    
    kprintf("\n\t&4KERNEL PANIC\n\t&a// %s\n\n\t&f", witty_comments[clock_tick % 8]); 
  100db3:	58                   	pop    %eax
  100db4:	a1 b8 94 10 00       	mov    0x1094b8,%eax
  100db9:	5a                   	pop    %edx
  100dba:	83 e0 07             	and    $0x7,%eax
  100dbd:	ff 34 85 20 51 10 00 	pushl  0x105120(,%eax,4)
  100dc4:	68 54 52 10 00       	push   $0x105254
  100dc9:	e8 22 f9 ff ff       	call   1006f0 <kprintf>
    
    kprintfva(message, va);
  100dce:	59                   	pop    %ecx
  100dcf:	58                   	pop    %eax
  100dd0:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  100dd4:	50                   	push   %eax
  100dd5:	ff 74 24 2c          	pushl  0x2c(%esp)
  100dd9:	e8 22 f7 ff ff       	call   100500 <kprintfva>
    kprintf("\n\t&7at %s &e%s&f() &7ln%d", file, function, line); 
  100dde:	ff 74 24 2c          	pushl  0x2c(%esp)
  100de2:	ff 74 24 2c          	pushl  0x2c(%esp)
  100de6:	ff 74 24 2c          	pushl  0x2c(%esp)
  100dea:	68 21 61 10 00       	push   $0x106121
  100def:	e8 fc f8 ff ff       	call   1006f0 <kprintf>
    
    kprintf("\n\n");
  100df4:	83 c4 14             	add    $0x14,%esp
  100df7:	68 52 61 10 00       	push   $0x106152
  100dfc:	e8 ef f8 ff ff       	call   1006f0 <kprintf>
    kprintf("\n\t&eDiagnostic:&7");
  100e01:	c7 04 24 3b 61 10 00 	movl   $0x10613b,(%esp)
  100e08:	e8 e3 f8 ff ff       	call   1006f0 <kprintf>
    kprintf("\n\tThe kernel was running for %d tick.", clock_tick);
  100e0d:	58                   	pop    %eax
  100e0e:	5a                   	pop    %edx
  100e0f:	ff 35 b8 94 10 00    	pushl  0x1094b8
  100e15:	68 74 52 10 00       	push   $0x105274
  100e1a:	e8 d1 f8 ff ff       	call   1006f0 <kprintf>

    if (reg != NULL)
  100e1f:	83 c4 10             	add    $0x10,%esp
  100e22:	85 db                	test   %ebx,%ebx
  100e24:	74 7d                	je     100ea3 <__panic+0x103>
    {
        kprintf("\n\tint_no=%x(%u), err_code=%x(%u)", reg->int_no, reg->int_no, reg->err_code, reg->err_code);
  100e26:	8b 53 04             	mov    0x4(%ebx),%edx
  100e29:	8b 03                	mov    (%ebx),%eax
  100e2b:	83 ec 0c             	sub    $0xc,%esp
  100e2e:	52                   	push   %edx
  100e2f:	52                   	push   %edx
  100e30:	50                   	push   %eax
  100e31:	50                   	push   %eax
  100e32:	68 9c 52 10 00       	push   $0x10529c
  100e37:	e8 b4 f8 ff ff       	call   1006f0 <kprintf>
        kprintf("\n\teax=%x, ecx=%x, edx=%x, ebx=%x\n\tesp=%x, ebp=%x, esi=%x, edi=%x", reg->eax, reg->ecx, reg->edx, reg->ebx, reg->esp, reg->ebp, reg->esi, reg->edi);
  100e3c:	83 c4 14             	add    $0x14,%esp
  100e3f:	ff 73 18             	pushl  0x18(%ebx)
  100e42:	ff 73 1c             	pushl  0x1c(%ebx)
  100e45:	ff 73 20             	pushl  0x20(%ebx)
  100e48:	ff 73 24             	pushl  0x24(%ebx)
  100e4b:	ff 73 28             	pushl  0x28(%ebx)
  100e4e:	ff 73 2c             	pushl  0x2c(%ebx)
  100e51:	ff 73 30             	pushl  0x30(%ebx)
  100e54:	ff 73 34             	pushl  0x34(%ebx)
  100e57:	68 c0 52 10 00       	push   $0x1052c0
  100e5c:	e8 8f f8 ff ff       	call   1006f0 <kprintf>
        kprintf("\n\n\n\n");
  100e61:	83 c4 24             	add    $0x24,%esp
  100e64:	68 50 61 10 00       	push   $0x106150
  100e69:	e8 82 f8 ff ff       	call   1006f0 <kprintf>
  100e6e:	83 c4 10             	add    $0x10,%esp
    {
        kprintf("\n\n\n\n\n\n\n");
    }


    kprintf("\n\n");
  100e71:	83 ec 0c             	sub    $0xc,%esp
  100e74:	68 52 61 10 00       	push   $0x106152
  100e79:	e8 72 f8 ff ff       	call   1006f0 <kprintf>
    
    kprintf("\n\t&fPress any key to reboot...\n"); 
  100e7e:	c7 04 24 04 53 10 00 	movl   $0x105304,(%esp)
  100e85:	e8 66 f8 ff ff       	call   1006f0 <kprintf>

    kprintf("\n&8------------------------------------------------------------ core one v0.0.1 ---");
  100e8a:	c7 04 24 24 53 10 00 	movl   $0x105324,(%esp)
  100e91:	e8 5a f8 ff ff       	call   1006f0 <kprintf>
  100e96:	83 c4 10             	add    $0x10,%esp
  100e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("hlt");
  100ea0:	f4                   	hlt    
  100ea1:	eb fd                	jmp    100ea0 <__panic+0x100>
        kprintf("\n\n\n\n\n\n\n");
  100ea3:	83 ec 0c             	sub    $0xc,%esp
  100ea6:	68 4d 61 10 00       	push   $0x10614d
  100eab:	e8 40 f8 ff ff       	call   1006f0 <kprintf>
  100eb0:	83 c4 10             	add    $0x10,%esp
  100eb3:	eb bc                	jmp    100e71 <__panic+0xd1>
  100eb5:	66 90                	xchg   %ax,%ax
  100eb7:	66 90                	xchg   %ax,%ax
  100eb9:	66 90                	xchg   %ax,%ax
  100ebb:	66 90                	xchg   %ax,%ax
  100ebd:	66 90                	xchg   %ax,%ax
  100ebf:	90                   	nop

00100ec0 <install_console>:
#include "kernel/kernel.h"

console_t console;

bool install_console()
{
  100ec0:	83 ec 0c             	sub    $0xc,%esp
    install_vga();
  100ec3:	e8 c8 04 00 00       	call   101390 <install_vga>

    console.cursor_x = 0;
  100ec8:	c7 05 a8 94 10 00 00 	movl   $0x0,0x1094a8
  100ecf:	00 00 00 
    console.cursor_y = 0;
  100ed2:	c7 05 ac 94 10 00 00 	movl   $0x0,0x1094ac
  100ed9:	00 00 00 
        kprintf("&%xc", i);
    }
    kprintf("\n");*/

    return true;
}
  100edc:	b8 01 00 00 00       	mov    $0x1,%eax
    console.color_bg = vga_Black;
  100ee1:	c6 05 b1 94 10 00 00 	movb   $0x0,0x1094b1
    console.color_fg = vga_Light_Gray;
  100ee8:	c6 05 b0 94 10 00 07 	movb   $0x7,0x1094b0
}
  100eef:	83 c4 0c             	add    $0xc,%esp
  100ef2:	c3                   	ret    
  100ef3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100f00 <console_print>:

void console_print(string message)
{
  100f00:	57                   	push   %edi
  100f01:	56                   	push   %esi
  100f02:	53                   	push   %ebx
  100f03:	31 db                	xor    %ebx,%ebx
  100f05:	83 ec 10             	sub    $0x10,%esp
  100f08:	8b 74 24 20          	mov    0x20(%esp),%esi
  100f0c:	8d 7c 24 0e          	lea    0xe(%esp),%edi
    bool wait_for_color_id = false;

    for(u32 i = 0; message[i]; i++)
  100f10:	0f be 06             	movsbl (%esi),%eax
  100f13:	83 c6 01             	add    $0x1,%esi
  100f16:	84 c0                	test   %al,%al
  100f18:	75 11                	jne    100f2b <console_print+0x2b>
  100f1a:	e9 84 00 00 00       	jmp    100fa3 <console_print+0xa3>
  100f1f:	90                   	nop
  100f20:	83 c6 01             	add    $0x1,%esi
  100f23:	0f be 46 ff          	movsbl -0x1(%esi),%eax
  100f27:	84 c0                	test   %al,%al
  100f29:	74 78                	je     100fa3 <console_print+0xa3>
    {
        char c = message[i];

        if (wait_for_color_id == true)
  100f2b:	80 fb 01             	cmp    $0x1,%bl
  100f2e:	0f 84 9c 00 00 00    	je     100fd0 <console_print+0xd0>

            wait_for_color_id = false;
        }
        else
        {
            switch (c)
  100f34:	3c 0a                	cmp    $0xa,%al
  100f36:	0f 84 64 01 00 00    	je     1010a0 <console_print+0x1a0>
  100f3c:	0f 8e de 00 00 00    	jle    101020 <console_print+0x120>
  100f42:	3c 0d                	cmp    $0xd,%al
  100f44:	0f 84 36 01 00 00    	je     101080 <console_print+0x180>
  100f4a:	3c 26                	cmp    $0x26,%al
  100f4c:	0f 85 ee 00 00 00    	jne    101040 <console_print+0x140>
  100f52:	a1 a8 94 10 00       	mov    0x1094a8,%eax
                    console.cursor_y++;
                    console.cursor_x = 0;
                    break;
                
                case ASCII_AND:
                    wait_for_color_id = true;
  100f57:	bb 01 00 00 00       	mov    $0x1,%ebx
                    console.cursor_x++;
                    break;
            }
        }

        if (console.cursor_x >= vga_screen_width)
  100f5c:	83 f8 4f             	cmp    $0x4f,%eax
  100f5f:	0f 86 a4 00 00 00    	jbe    101009 <console_print+0x109>
        {
            console.cursor_x = 0;
            console.cursor_y++;
  100f65:	a1 ac 94 10 00       	mov    0x1094ac,%eax
            console.cursor_x = 0;
  100f6a:	c7 05 a8 94 10 00 00 	movl   $0x0,0x1094a8
  100f71:	00 00 00 
            console.cursor_y++;
  100f74:	83 c0 01             	add    $0x1,%eax
  100f77:	a3 ac 94 10 00       	mov    %eax,0x1094ac
        }

        if (console.cursor_y >= vga_screen_height)
  100f7c:	83 f8 18             	cmp    $0x18,%eax
  100f7f:	76 9f                	jbe    100f20 <console_print+0x20>
        {
            console.cursor_x = 0;
            console.cursor_y--;
  100f81:	83 e8 01             	sub    $0x1,%eax
  100f84:	83 c6 01             	add    $0x1,%esi
            console.cursor_x = 0;
  100f87:	c7 05 a8 94 10 00 00 	movl   $0x0,0x1094a8
  100f8e:	00 00 00 
            console.cursor_y--;
  100f91:	a3 ac 94 10 00       	mov    %eax,0x1094ac
            vga_scroll();
  100f96:	e8 b5 05 00 00       	call   101550 <vga_scroll>
    for(u32 i = 0; message[i]; i++)
  100f9b:	0f be 46 ff          	movsbl -0x1(%esi),%eax
  100f9f:	84 c0                	test   %al,%al
  100fa1:	75 88                	jne    100f2b <console_print+0x2b>
        }
    }

    vga_set_cursor(console.cursor_x, console.cursor_y);
  100fa3:	83 ec 08             	sub    $0x8,%esp
  100fa6:	ff 35 ac 94 10 00    	pushl  0x1094ac
  100fac:	ff 35 a8 94 10 00    	pushl  0x1094a8
  100fb2:	e8 69 06 00 00       	call   101620 <vga_set_cursor>
}
  100fb7:	83 c4 10             	add    $0x10,%esp
  100fba:	83 c4 10             	add    $0x10,%esp
  100fbd:	5b                   	pop    %ebx
  100fbe:	5e                   	pop    %esi
  100fbf:	5f                   	pop    %edi
  100fc0:	c3                   	ret    
  100fc1:	eb 0d                	jmp    100fd0 <console_print+0xd0>
  100fc3:	90                   	nop
  100fc4:	90                   	nop
  100fc5:	90                   	nop
  100fc6:	90                   	nop
  100fc7:	90                   	nop
  100fc8:	90                   	nop
  100fc9:	90                   	nop
  100fca:	90                   	nop
  100fcb:	90                   	nop
  100fcc:	90                   	nop
  100fcd:	90                   	nop
  100fce:	90                   	nop
  100fcf:	90                   	nop
            if (c == ASCII_AND)
  100fd0:	3c 26                	cmp    $0x26,%al
  100fd2:	0f 84 e8 00 00 00    	je     1010c0 <console_print+0x1c0>
                char buffer[2] = " ";
  100fd8:	ba 20 00 00 00       	mov    $0x20,%edx
                console.color_fg = string_to_uint(buffer, 16);
  100fdd:	83 ec 08             	sub    $0x8,%esp
            wait_for_color_id = false;
  100fe0:	31 db                	xor    %ebx,%ebx
                char buffer[2] = " ";
  100fe2:	66 89 54 24 16       	mov    %dx,0x16(%esp)
                buffer[0] = c;
  100fe7:	88 44 24 16          	mov    %al,0x16(%esp)
                console.color_fg = string_to_uint(buffer, 16);
  100feb:	6a 10                	push   $0x10
  100fed:	57                   	push   %edi
  100fee:	e8 1d f0 ff ff       	call   100010 <string_to_uint>
  100ff3:	a2 b0 94 10 00       	mov    %al,0x1094b0
  100ff8:	a1 a8 94 10 00       	mov    0x1094a8,%eax
  100ffd:	83 c4 10             	add    $0x10,%esp
        if (console.cursor_x >= vga_screen_width)
  101000:	83 f8 4f             	cmp    $0x4f,%eax
  101003:	0f 87 5c ff ff ff    	ja     100f65 <console_print+0x65>
  101009:	a1 ac 94 10 00       	mov    0x1094ac,%eax
  10100e:	e9 69 ff ff ff       	jmp    100f7c <console_print+0x7c>
  101013:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            switch (c)
  101020:	3c 09                	cmp    $0x9,%al
  101022:	75 1c                	jne    101040 <console_print+0x140>
                    console.cursor_x = console.cursor_x + TAB_SIZE - (console.cursor_x % TAB_SIZE);
  101024:	a1 a8 94 10 00       	mov    0x1094a8,%eax
  101029:	83 e0 f8             	and    $0xfffffff8,%eax
  10102c:	83 c0 08             	add    $0x8,%eax
  10102f:	a3 a8 94 10 00       	mov    %eax,0x1094a8
                    break;
  101034:	e9 23 ff ff ff       	jmp    100f5c <console_print+0x5c>
  101039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                    vga_set_cell(console.cursor_x, console.cursor_y, c, vga_color(console.color_bg, console.color_fg));
  101040:	0f b6 15 b1 94 10 00 	movzbl 0x1094b1,%edx
  101047:	c1 e2 04             	shl    $0x4,%edx
  10104a:	0a 15 b0 94 10 00    	or     0x1094b0,%dl
  101050:	0f b6 d2             	movzbl %dl,%edx
  101053:	52                   	push   %edx
  101054:	50                   	push   %eax
  101055:	ff 35 ac 94 10 00    	pushl  0x1094ac
  10105b:	ff 35 a8 94 10 00    	pushl  0x1094a8
  101061:	e8 8a 05 00 00       	call   1015f0 <vga_set_cell>
                    console.cursor_x++;
  101066:	a1 a8 94 10 00       	mov    0x1094a8,%eax
                    break;
  10106b:	83 c4 10             	add    $0x10,%esp
                    console.cursor_x++;
  10106e:	83 c0 01             	add    $0x1,%eax
  101071:	a3 a8 94 10 00       	mov    %eax,0x1094a8
                    break;
  101076:	e9 e1 fe ff ff       	jmp    100f5c <console_print+0x5c>
  10107b:	90                   	nop
  10107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                    console.cursor_x = 0;
  101080:	c7 05 a8 94 10 00 00 	movl   $0x0,0x1094a8
  101087:	00 00 00 
  10108a:	a1 ac 94 10 00       	mov    0x1094ac,%eax
                    break;
  10108f:	e9 e8 fe ff ff       	jmp    100f7c <console_print+0x7c>
  101094:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10109a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
                    console.cursor_y++;
  1010a0:	a1 ac 94 10 00       	mov    0x1094ac,%eax
                    console.cursor_x = 0;
  1010a5:	c7 05 a8 94 10 00 00 	movl   $0x0,0x1094a8
  1010ac:	00 00 00 
                    console.cursor_y++;
  1010af:	83 c0 01             	add    $0x1,%eax
  1010b2:	a3 ac 94 10 00       	mov    %eax,0x1094ac
                    break;
  1010b7:	e9 c0 fe ff ff       	jmp    100f7c <console_print+0x7c>
  1010bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                vga_set_cell(console.cursor_x, console.cursor_y, c, vga_color(console.color_bg, console.color_fg));
  1010c0:	0f b6 05 b1 94 10 00 	movzbl 0x1094b1,%eax
            wait_for_color_id = false;
  1010c7:	31 db                	xor    %ebx,%ebx
                vga_set_cell(console.cursor_x, console.cursor_y, c, vga_color(console.color_bg, console.color_fg));
  1010c9:	c1 e0 04             	shl    $0x4,%eax
  1010cc:	0a 05 b0 94 10 00    	or     0x1094b0,%al
  1010d2:	0f b6 c0             	movzbl %al,%eax
  1010d5:	50                   	push   %eax
  1010d6:	6a 26                	push   $0x26
  1010d8:	ff 35 ac 94 10 00    	pushl  0x1094ac
  1010de:	ff 35 a8 94 10 00    	pushl  0x1094a8
  1010e4:	e8 07 05 00 00       	call   1015f0 <vga_set_cell>
                console.cursor_x++;
  1010e9:	a1 a8 94 10 00       	mov    0x1094a8,%eax
  1010ee:	83 c4 10             	add    $0x10,%esp
  1010f1:	83 c0 01             	add    $0x1,%eax
  1010f4:	a3 a8 94 10 00       	mov    %eax,0x1094a8
  1010f9:	e9 5e fe ff ff       	jmp    100f5c <console_print+0x5c>
  1010fe:	66 90                	xchg   %ax,%ax

00101100 <console_read>:
u32 console_read(string buffer, u32 size)
{
    UNUSED(buffer);
    UNUSED(size);
    return 0;
  101100:	31 c0                	xor    %eax,%eax
  101102:	c3                   	ret    
  101103:	66 90                	xchg   %ax,%ax
  101105:	66 90                	xchg   %ax,%ax
  101107:	66 90                	xchg   %ax,%ax
  101109:	66 90                	xchg   %ax,%ax
  10110b:	66 90                	xchg   %ax,%ax
  10110d:	66 90                	xchg   %ax,%ax
  10110f:	90                   	nop

00101110 <syscall_interrupt>:

    return true;
}

void syscall_interrupt(registry_t* reg)
{
  101110:	83 ec 14             	sub    $0x14,%esp
    UNUSED(reg);
    kprintf("syscall %d\n", reg->eax);
  101113:	8b 44 24 18          	mov    0x18(%esp),%eax
  101117:	ff 70 34             	pushl  0x34(%eax)
  10111a:	68 c4 61 10 00       	push   $0x1061c4
  10111f:	e8 cc f5 ff ff       	call   1006f0 <kprintf>
  101124:	83 c4 1c             	add    $0x1c,%esp
  101127:	c3                   	ret    
  101128:	90                   	nop
  101129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101130 <install_syscall>:
{
  101130:	83 ec 14             	sub    $0x14,%esp
    add_interrupts_handler(30, &syscall_interrupt);
  101133:	68 10 11 10 00       	push   $0x101110
  101138:	6a 1e                	push   $0x1e
  10113a:	e8 11 f8 ff ff       	call   100950 <add_interrupts_handler>
}
  10113f:	b8 01 00 00 00       	mov    $0x1,%eax
  101144:	83 c4 1c             	add    $0x1c,%esp
  101147:	c3                   	ret    
  101148:	66 90                	xchg   %ax,%ax
  10114a:	66 90                	xchg   %ax,%ax
  10114c:	66 90                	xchg   %ax,%ax
  10114e:	66 90                	xchg   %ax,%ax

00101150 <task1>:
#include "kernel/syscall.h"
#include "kernel/x86.h"

void task1(void)
{
    asm("mov $0x01, %eax; int $0x30");
  101150:	b8 01 00 00 00       	mov    $0x1,%eax
  101155:	cd 30                	int    $0x30
  101157:	eb fe                	jmp    101157 <task1+0x7>
  101159:	66 90                	xchg   %ax,%ax
  10115b:	66 90                	xchg   %ax,%ax
  10115d:	66 90                	xchg   %ax,%ax
  10115f:	90                   	nop

00101160 <is_cmos_update>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101160:	ba 70 00 00 00       	mov    $0x70,%edx
  101165:	b8 0a 00 00 00       	mov    $0xa,%eax
  10116a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10116b:	ba 71 00 00 00       	mov    $0x71,%edx
  101170:	ec                   	in     (%dx),%al
#include "kernel/x86.h"

bool is_cmos_update()
{
    outb(CMOS_ADDRESS, 0x0A);
    return (inb(CMOS_DATA) & 0x80);
  101171:	83 e0 80             	and    $0xffffff80,%eax
}
  101174:	c3                   	ret    
  101175:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101180 <get_realtime_reg>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101180:	ba 70 00 00 00       	mov    $0x70,%edx
  101185:	8b 44 24 04          	mov    0x4(%esp),%eax
  101189:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10118a:	ba 71 00 00 00       	mov    $0x71,%edx
  10118f:	ec                   	in     (%dx),%al

u8 get_realtime_reg(s32 reg)
{
    outb(CMOS_ADDRESS, reg);
    return inb(CMOS_DATA);
}
  101190:	c3                   	ret    
  101191:	eb 0d                	jmp    1011a0 <time_get>
  101193:	90                   	nop
  101194:	90                   	nop
  101195:	90                   	nop
  101196:	90                   	nop
  101197:	90                   	nop
  101198:	90                   	nop
  101199:	90                   	nop
  10119a:	90                   	nop
  10119b:	90                   	nop
  10119c:	90                   	nop
  10119d:	90                   	nop
  10119e:	90                   	nop
  10119f:	90                   	nop

001011a0 <time_get>:

u32 time_get(u32 selector)
{
  1011a0:	56                   	push   %esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1011a1:	be 0a 00 00 00       	mov    $0xa,%esi
  1011a6:	53                   	push   %ebx
  1011a7:	bb 70 00 00 00       	mov    $0x70,%ebx
  1011ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1011b0:	89 f0                	mov    %esi,%eax
  1011b2:	89 da                	mov    %ebx,%edx
  1011b4:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1011b5:	b9 71 00 00 00       	mov    $0x71,%ecx
  1011ba:	89 ca                	mov    %ecx,%edx
  1011bc:	ec                   	in     (%dx),%al
    while (is_cmos_update());
  1011bd:	84 c0                	test   %al,%al
  1011bf:	78 ef                	js     1011b0 <time_get+0x10>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1011c1:	be 70 00 00 00       	mov    $0x70,%esi
  1011c6:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
  1011cb:	89 f2                	mov    %esi,%edx
  1011cd:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1011ce:	89 ca                	mov    %ecx,%edx
  1011d0:	ec                   	in     (%dx),%al
  1011d1:	89 c3                	mov    %eax,%ebx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1011d3:	89 f2                	mov    %esi,%edx
  1011d5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
  1011da:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1011db:	89 ca                	mov    %ecx,%edx
  1011dd:	ec                   	in     (%dx),%al
    return from_bcd(get_realtime_reg(selector));
  1011de:	c0 eb 04             	shr    $0x4,%bl
  1011e1:	83 e0 0f             	and    $0xf,%eax
  1011e4:	0f b6 d3             	movzbl %bl,%edx
  1011e7:	8d 14 92             	lea    (%edx,%edx,4),%edx
}
  1011ea:	5b                   	pop    %ebx
    return from_bcd(get_realtime_reg(selector));
  1011eb:	8d 04 50             	lea    (%eax,%edx,2),%eax
}
  1011ee:	5e                   	pop    %esi
  1011ef:	c3                   	ret    

001011f0 <time>:

time_t time(void)
{
  1011f0:	55                   	push   %ebp
  1011f1:	57                   	push   %edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1011f2:	bf 0a 00 00 00       	mov    $0xa,%edi
  1011f7:	56                   	push   %esi
  1011f8:	53                   	push   %ebx
  1011f9:	bb 70 00 00 00       	mov    $0x70,%ebx
  1011fe:	83 ec 0c             	sub    $0xc,%esp
  101201:	8b 74 24 20          	mov    0x20(%esp),%esi
  101205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  101210:	89 f8                	mov    %edi,%eax
  101212:	89 da                	mov    %ebx,%edx
  101214:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101215:	b9 71 00 00 00       	mov    $0x71,%ecx
  10121a:	89 ca                	mov    %ecx,%edx
  10121c:	ec                   	in     (%dx),%al
    // Waite for cmos update.
    while (is_cmos_update());
  10121d:	84 c0                	test   %al,%al
  10121f:	78 ef                	js     101210 <time+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101221:	31 ed                	xor    %ebp,%ebp
  101223:	bb 70 00 00 00       	mov    $0x70,%ebx
  101228:	89 e8                	mov    %ebp,%eax
  10122a:	89 da                	mov    %ebx,%edx
  10122c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10122d:	89 ca                	mov    %ecx,%edx
  10122f:	ec                   	in     (%dx),%al
  101230:	88 44 24 02          	mov    %al,0x2(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101234:	89 da                	mov    %ebx,%edx
  101236:	89 e8                	mov    %ebp,%eax
  101238:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101239:	89 ca                	mov    %ecx,%edx
  10123b:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10123c:	bd 02 00 00 00       	mov    $0x2,%ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101241:	88 44 24 03          	mov    %al,0x3(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101245:	89 da                	mov    %ebx,%edx
  101247:	89 e8                	mov    %ebp,%eax
  101249:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10124a:	89 ca                	mov    %ecx,%edx
  10124c:	ec                   	in     (%dx),%al
  10124d:	88 44 24 04          	mov    %al,0x4(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101251:	89 da                	mov    %ebx,%edx
  101253:	89 e8                	mov    %ebp,%eax
  101255:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101256:	89 ca                	mov    %ecx,%edx
  101258:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101259:	bd 04 00 00 00       	mov    $0x4,%ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10125e:	88 44 24 05          	mov    %al,0x5(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101262:	89 da                	mov    %ebx,%edx
  101264:	89 e8                	mov    %ebp,%eax
  101266:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101267:	89 ca                	mov    %ecx,%edx
  101269:	ec                   	in     (%dx),%al
  10126a:	88 44 24 06          	mov    %al,0x6(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10126e:	89 da                	mov    %ebx,%edx
  101270:	89 e8                	mov    %ebp,%eax
  101272:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101273:	89 ca                	mov    %ecx,%edx
  101275:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101276:	bd 07 00 00 00       	mov    $0x7,%ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10127b:	88 44 24 07          	mov    %al,0x7(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10127f:	89 da                	mov    %ebx,%edx
  101281:	89 e8                	mov    %ebp,%eax
  101283:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101284:	89 ca                	mov    %ecx,%edx
  101286:	ec                   	in     (%dx),%al
  101287:	88 44 24 08          	mov    %al,0x8(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10128b:	89 da                	mov    %ebx,%edx
  10128d:	89 e8                	mov    %ebp,%eax
  10128f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101290:	89 ca                	mov    %ecx,%edx
  101292:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101293:	bd 08 00 00 00       	mov    $0x8,%ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101298:	88 44 24 09          	mov    %al,0x9(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10129c:	89 da                	mov    %ebx,%edx
  10129e:	89 e8                	mov    %ebp,%eax
  1012a0:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1012a1:	89 ca                	mov    %ecx,%edx
  1012a3:	ec                   	in     (%dx),%al
  1012a4:	88 44 24 0a          	mov    %al,0xa(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1012a8:	89 da                	mov    %ebx,%edx
  1012aa:	89 e8                	mov    %ebp,%eax
  1012ac:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1012ad:	89 ca                	mov    %ecx,%edx
  1012af:	ec                   	in     (%dx),%al
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1012b0:	bd 09 00 00 00       	mov    $0x9,%ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1012b5:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1012b7:	89 da                	mov    %ebx,%edx
  1012b9:	89 e8                	mov    %ebp,%eax
  1012bb:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1012bc:	89 ca                	mov    %ecx,%edx
  1012be:	ec                   	in     (%dx),%al
  1012bf:	88 44 24 0b          	mov    %al,0xb(%esp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1012c3:	89 da                	mov    %ebx,%edx
  1012c5:	89 e8                	mov    %ebp,%eax
  1012c7:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1012c8:	89 ca                	mov    %ecx,%edx
  1012ca:	ec                   	in     (%dx),%al
    time_t time;

    time.second = from_bcd(get_realtime_reg(0x00));
  1012cb:	0f b6 4c 24 02       	movzbl 0x2(%esp),%ecx
    time.minute = from_bcd(get_realtime_reg(0x02));
    time.hour = from_bcd(get_realtime_reg(0x04));
    time.day = from_bcd(get_realtime_reg(0x07));
    time.month = from_bcd(get_realtime_reg(0x08));
    time.year = from_bcd(get_realtime_reg(0x09));
  1012d0:	83 e0 0f             	and    $0xf,%eax
    time.second = from_bcd(get_realtime_reg(0x00));
  1012d3:	c0 e9 04             	shr    $0x4,%cl
  1012d6:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  1012dd:	01 ca                	add    %ecx,%edx
  1012df:	0f b6 4c 24 03       	movzbl 0x3(%esp),%ecx
  1012e4:	01 d2                	add    %edx,%edx
  1012e6:	83 e1 0f             	and    $0xf,%ecx
  1012e9:	01 ca                	add    %ecx,%edx
    time.minute = from_bcd(get_realtime_reg(0x02));
  1012eb:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
    time.second = from_bcd(get_realtime_reg(0x00));
  1012f0:	88 16                	mov    %dl,(%esi)
    time.minute = from_bcd(get_realtime_reg(0x02));
  1012f2:	c0 e9 04             	shr    $0x4,%cl
  1012f5:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  1012fc:	01 ca                	add    %ecx,%edx
  1012fe:	0f b6 4c 24 05       	movzbl 0x5(%esp),%ecx
  101303:	01 d2                	add    %edx,%edx
  101305:	83 e1 0f             	and    $0xf,%ecx
  101308:	01 ca                	add    %ecx,%edx
    time.hour = from_bcd(get_realtime_reg(0x04));
  10130a:	0f b6 4c 24 06       	movzbl 0x6(%esp),%ecx
    time.minute = from_bcd(get_realtime_reg(0x02));
  10130f:	88 56 01             	mov    %dl,0x1(%esi)
    time.hour = from_bcd(get_realtime_reg(0x04));
  101312:	c0 e9 04             	shr    $0x4,%cl
  101315:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  10131c:	01 ca                	add    %ecx,%edx
  10131e:	0f b6 4c 24 07       	movzbl 0x7(%esp),%ecx
  101323:	01 d2                	add    %edx,%edx
  101325:	83 e1 0f             	and    $0xf,%ecx
  101328:	01 ca                	add    %ecx,%edx
    time.day = from_bcd(get_realtime_reg(0x07));
  10132a:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    time.hour = from_bcd(get_realtime_reg(0x04));
  10132f:	88 56 02             	mov    %dl,0x2(%esi)
    time.day = from_bcd(get_realtime_reg(0x07));
  101332:	c0 e9 04             	shr    $0x4,%cl
  101335:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  10133c:	01 ca                	add    %ecx,%edx
  10133e:	0f b6 4c 24 09       	movzbl 0x9(%esp),%ecx
  101343:	01 d2                	add    %edx,%edx
  101345:	83 e1 0f             	and    $0xf,%ecx
  101348:	01 ca                	add    %ecx,%edx
    time.month = from_bcd(get_realtime_reg(0x08));
  10134a:	0f b6 4c 24 0a       	movzbl 0xa(%esp),%ecx
    time.day = from_bcd(get_realtime_reg(0x07));
  10134f:	88 56 03             	mov    %dl,0x3(%esi)
    time.month = from_bcd(get_realtime_reg(0x08));
  101352:	c0 e9 04             	shr    $0x4,%cl
  101355:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  10135c:	01 ca                	add    %ecx,%edx
  10135e:	89 f9                	mov    %edi,%ecx
  101360:	01 d2                	add    %edx,%edx
  101362:	83 e1 0f             	and    $0xf,%ecx
  101365:	01 ca                	add    %ecx,%edx
  101367:	88 56 04             	mov    %dl,0x4(%esi)
    time.year = from_bcd(get_realtime_reg(0x09));
  10136a:	0f b6 54 24 0b       	movzbl 0xb(%esp),%edx
  10136f:	c0 ea 04             	shr    $0x4,%dl
  101372:	0f b6 d2             	movzbl %dl,%edx
  101375:	8d 14 92             	lea    (%edx,%edx,4),%edx
  101378:	8d 04 50             	lea    (%eax,%edx,2),%eax
  10137b:	89 46 08             	mov    %eax,0x8(%esi)

    return time;
  10137e:	83 c4 0c             	add    $0xc,%esp
  101381:	89 f0                	mov    %esi,%eax
  101383:	5b                   	pop    %ebx
  101384:	5e                   	pop    %esi
  101385:	5f                   	pop    %edi
  101386:	5d                   	pop    %ebp
  101387:	c2 04 00             	ret    $0x4
  10138a:	66 90                	xchg   %ax,%ax
  10138c:	66 90                	xchg   %ax,%ax
  10138e:	66 90                	xchg   %ax,%ax

00101390 <install_vga>:
#include "kernel/x86.h"

u16 *video_memory = (u16 *)vga_frame_buffer;

bool install_vga(void)
{
  101390:	55                   	push   %ebp
  101391:	57                   	push   %edi
  101392:	56                   	push   %esi
  101393:	53                   	push   %ebx
  101394:	31 db                	xor    %ebx,%ebx
  101396:	83 ec 08             	sub    $0x8,%esp
  101399:	a1 08 70 10 00       	mov    0x107008,%eax
  10139e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1013a2:	89 c6                	mov    %eax,%esi
  1013a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1013aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
  1013b0:	89 f0                	mov    %esi,%eax
  1013b2:	d1 e8                	shr    %eax
  1013b4:	83 e0 01             	and    $0x1,%eax
  1013b7:	0f 84 a3 00 00 00    	je     101460 <install_vga+0xd0>
}

void vga_set_cell(u32 x, u32 y, char c, u8 color)
{
    u16 cell = color << 8 | c;
    video_memory[x + y * vga_screen_width] = cell;
  1013bd:	ba 20 0f 00 00       	mov    $0xf20,%edx
  1013c2:	bf 4e 00 00 00       	mov    $0x4e,%edi
  1013c7:	bd 4f 00 00 00       	mov    $0x4f,%ebp
  1013cc:	66 89 16             	mov    %dx,(%esi)
        for (u32 x = 0; x < vga_screen_width; x++)
  1013cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    video_memory[x + y * vga_screen_width] = cell;
  1013d6:	ba 27 00 00 00       	mov    $0x27,%edx
  1013db:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1013df:	01 d8                	add    %ebx,%eax
  1013e1:	8d 0c 41             	lea    (%ecx,%eax,2),%ecx
{
  1013e4:	31 c0                	xor    %eax,%eax
  1013e6:	8d 76 00             	lea    0x0(%esi),%esi
  1013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    video_memory[x + y * vga_screen_width] = cell;
  1013f0:	c7 04 81 20 0f 20 0f 	movl   $0xf200f20,(%ecx,%eax,4)
  1013f7:	83 c0 01             	add    $0x1,%eax
  1013fa:	39 c2                	cmp    %eax,%edx
  1013fc:	77 f2                	ja     1013f0 <install_vga+0x60>
  1013fe:	8b 04 24             	mov    (%esp),%eax
  101401:	01 f8                	add    %edi,%eax
  101403:	39 fd                	cmp    %edi,%ebp
  101405:	74 0f                	je     101416 <install_vga+0x86>
  101407:	8b 7c 24 04          	mov    0x4(%esp),%edi
  10140b:	01 d8                	add    %ebx,%eax
  10140d:	b9 20 0f 00 00       	mov    $0xf20,%ecx
  101412:	66 89 0c 47          	mov    %cx,(%edi,%eax,2)
  101416:	83 c3 50             	add    $0x50,%ebx
  101419:	81 c6 a0 00 00 00    	add    $0xa0,%esi
    for (u32 y = 0; y < vga_screen_height; y++)
  10141f:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
  101425:	75 89                	jne    1013b0 <install_vga+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101427:	be d4 03 00 00       	mov    $0x3d4,%esi
  10142c:	b8 0e 00 00 00       	mov    $0xe,%eax
  101431:	89 f2                	mov    %esi,%edx
  101433:	ee                   	out    %al,(%dx)
  101434:	31 c9                	xor    %ecx,%ecx
  101436:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  10143b:	89 c8                	mov    %ecx,%eax
  10143d:	89 da                	mov    %ebx,%edx
  10143f:	ee                   	out    %al,(%dx)
  101440:	b8 0f 00 00 00       	mov    $0xf,%eax
  101445:	89 f2                	mov    %esi,%edx
  101447:	ee                   	out    %al,(%dx)
  101448:	89 c8                	mov    %ecx,%eax
  10144a:	89 da                	mov    %ebx,%edx
  10144c:	ee                   	out    %al,(%dx)
}
  10144d:	83 c4 08             	add    $0x8,%esp
  101450:	b8 01 00 00 00       	mov    $0x1,%eax
  101455:	5b                   	pop    %ebx
  101456:	5e                   	pop    %esi
  101457:	5f                   	pop    %edi
  101458:	5d                   	pop    %ebp
  101459:	c3                   	ret    
  10145a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        for (u32 x = 0; x < vga_screen_width; x++)
  101460:	bf 50 00 00 00       	mov    $0x50,%edi
  101465:	ba 28 00 00 00       	mov    $0x28,%edx
  10146a:	bd 50 00 00 00       	mov    $0x50,%ebp
  10146f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  101476:	e9 60 ff ff ff       	jmp    1013db <install_vga+0x4b>
  10147b:	90                   	nop
  10147c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00101480 <vga_clear>:
{
  101480:	55                   	push   %ebp
  101481:	57                   	push   %edi
  101482:	31 ff                	xor    %edi,%edi
  101484:	56                   	push   %esi
  101485:	53                   	push   %ebx
  101486:	83 ec 14             	sub    $0x14,%esp
  101489:	8b 35 08 70 10 00    	mov    0x107008,%esi
  10148f:	0f b6 44 24 28       	movzbl 0x28(%esp),%eax
  101494:	89 74 24 0c          	mov    %esi,0xc(%esp)
  101498:	89 f5                	mov    %esi,%ebp
  10149a:	c1 e0 08             	shl    $0x8,%eax
  10149d:	83 c8 20             	or     $0x20,%eax
  1014a0:	89 c6                	mov    %eax,%esi
  1014a2:	c1 e6 10             	shl    $0x10,%esi
  1014a5:	89 74 24 10          	mov    %esi,0x10(%esp)
  1014a9:	89 c6                	mov    %eax,%esi
  1014ab:	90                   	nop
  1014ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1014b0:	89 e8                	mov    %ebp,%eax
  1014b2:	d1 e8                	shr    %eax
  1014b4:	83 e0 01             	and    $0x1,%eax
  1014b7:	74 77                	je     101530 <vga_clear+0xb0>
    video_memory[x + y * vga_screen_width] = cell;
  1014b9:	66 89 75 00          	mov    %si,0x0(%ebp)
  1014bd:	c7 44 24 08 4e 00 00 	movl   $0x4e,0x8(%esp)
  1014c4:	00 
  1014c5:	ba 27 00 00 00       	mov    $0x27,%edx
  1014ca:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
        for (u32 x = 0; x < vga_screen_width; x++)
  1014d1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  1014d8:	00 
  1014d9:	89 f1                	mov    %esi,%ecx
  1014db:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  1014df:	01 f8                	add    %edi,%eax
  1014e1:	81 e1 20 ff 00 00    	and    $0xff20,%ecx
  1014e7:	0b 4c 24 10          	or     0x10(%esp),%ecx
  1014eb:	8d 1c 43             	lea    (%ebx,%eax,2),%ebx
{
  1014ee:	31 c0                	xor    %eax,%eax
    video_memory[x + y * vga_screen_width] = cell;
  1014f0:	89 0c 83             	mov    %ecx,(%ebx,%eax,4)
  1014f3:	83 c0 01             	add    $0x1,%eax
  1014f6:	39 c2                	cmp    %eax,%edx
  1014f8:	77 f6                	ja     1014f0 <vga_clear+0x70>
  1014fa:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1014fe:	8b 44 24 04          	mov    0x4(%esp),%eax
  101502:	01 c8                	add    %ecx,%eax
  101504:	39 0c 24             	cmp    %ecx,(%esp)
  101507:	74 0a                	je     101513 <vga_clear+0x93>
  101509:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  10150d:	01 f8                	add    %edi,%eax
  10150f:	66 89 34 43          	mov    %si,(%ebx,%eax,2)
  101513:	83 c7 50             	add    $0x50,%edi
  101516:	81 c5 a0 00 00 00    	add    $0xa0,%ebp
    for (u32 y = 0; y < vga_screen_height; y++)
  10151c:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  101522:	75 8c                	jne    1014b0 <vga_clear+0x30>
}
  101524:	83 c4 14             	add    $0x14,%esp
  101527:	5b                   	pop    %ebx
  101528:	5e                   	pop    %esi
  101529:	5f                   	pop    %edi
  10152a:	5d                   	pop    %ebp
  10152b:	c3                   	ret    
  10152c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (u32 x = 0; x < vga_screen_width; x++)
  101530:	c7 44 24 08 50 00 00 	movl   $0x50,0x8(%esp)
  101537:	00 
  101538:	ba 28 00 00 00       	mov    $0x28,%edx
  10153d:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
  101544:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10154b:	00 
  10154c:	eb 8b                	jmp    1014d9 <vga_clear+0x59>
  10154e:	66 90                	xchg   %ax,%ax

00101550 <vga_scroll>:
{
  101550:	56                   	push   %esi
  101551:	53                   	push   %ebx
  101552:	8b 1d 08 70 10 00    	mov    0x107008,%ebx
  101558:	8d b3 a0 00 00 00    	lea    0xa0(%ebx),%esi
  10155e:	66 90                	xchg   %ax,%ax
  101560:	8d 8b 40 10 00 00    	lea    0x1040(%ebx),%ecx
  101566:	89 d8                	mov    %ebx,%eax
  101568:	90                   	nop
  101569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            video_memory[x + y * vga_screen_width] = video_memory[x + (y + 1) * vga_screen_width];
  101570:	0f b7 90 a0 00 00 00 	movzwl 0xa0(%eax),%edx
  101577:	05 a0 00 00 00       	add    $0xa0,%eax
  10157c:	66 89 90 60 ff ff ff 	mov    %dx,-0xa0(%eax)
        for (u32 y = 0; y < vga_screen_height + 1; y++)
  101583:	39 c8                	cmp    %ecx,%eax
  101585:	75 e9                	jne    101570 <vga_scroll+0x20>
  101587:	83 c3 02             	add    $0x2,%ebx
    for (u32 x = 0; x < vga_screen_width; x++)
  10158a:	39 de                	cmp    %ebx,%esi
  10158c:	75 d2                	jne    101560 <vga_scroll+0x10>
}
  10158e:	5b                   	pop    %ebx
  10158f:	5e                   	pop    %esi
  101590:	c3                   	ret    
  101591:	eb 0d                	jmp    1015a0 <vga_set_cells>
  101593:	90                   	nop
  101594:	90                   	nop
  101595:	90                   	nop
  101596:	90                   	nop
  101597:	90                   	nop
  101598:	90                   	nop
  101599:	90                   	nop
  10159a:	90                   	nop
  10159b:	90                   	nop
  10159c:	90                   	nop
  10159d:	90                   	nop
  10159e:	90                   	nop
  10159f:	90                   	nop

001015a0 <vga_set_cells>:
{
  1015a0:	56                   	push   %esi
  1015a1:	53                   	push   %ebx
  1015a2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  1015a6:	8b 54 24 10          	mov    0x10(%esp),%edx
  1015aa:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    while (str[i]){
  1015ae:	66 0f be 03          	movsbw (%ebx),%ax
  1015b2:	84 c0                	test   %al,%al
  1015b4:	74 2c                	je     1015e2 <vga_set_cells+0x42>
  1015b6:	8d 14 92             	lea    (%edx,%edx,4),%edx
  1015b9:	8b 35 08 70 10 00    	mov    0x107008,%esi
  1015bf:	c1 e1 08             	shl    $0x8,%ecx
  1015c2:	c1 e2 04             	shl    $0x4,%edx
  1015c5:	03 54 24 0c          	add    0xc(%esp),%edx
  1015c9:	8d 34 56             	lea    (%esi,%edx,2),%esi
  1015cc:	31 d2                	xor    %edx,%edx
  1015ce:	66 90                	xchg   %ax,%ax
    u16 cell = color << 8 | c;
  1015d0:	09 c8                	or     %ecx,%eax
  1015d2:	66 89 04 56          	mov    %ax,(%esi,%edx,2)
      i++;
  1015d6:	83 c2 01             	add    $0x1,%edx
    while (str[i]){
  1015d9:	66 0f be 04 13       	movsbw (%ebx,%edx,1),%ax
  1015de:	84 c0                	test   %al,%al
  1015e0:	75 ee                	jne    1015d0 <vga_set_cells+0x30>
}
  1015e2:	5b                   	pop    %ebx
  1015e3:	5e                   	pop    %esi
  1015e4:	c3                   	ret    
  1015e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1015e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001015f0 <vga_set_cell>:
    u16 cell = color << 8 | c;
  1015f0:	0f b6 54 24 10       	movzbl 0x10(%esp),%edx
{
  1015f5:	8b 44 24 08          	mov    0x8(%esp),%eax
    video_memory[x + y * vga_screen_width] = cell;
  1015f9:	8d 04 80             	lea    (%eax,%eax,4),%eax
    u16 cell = color << 8 | c;
  1015fc:	89 d1                	mov    %edx,%ecx
  1015fe:	66 0f be 54 24 0c    	movsbw 0xc(%esp),%dx
  101604:	c1 e1 08             	shl    $0x8,%ecx
    video_memory[x + y * vga_screen_width] = cell;
  101607:	c1 e0 04             	shl    $0x4,%eax
  10160a:	03 44 24 04          	add    0x4(%esp),%eax
    u16 cell = color << 8 | c;
  10160e:	09 ca                	or     %ecx,%edx
  101610:	8b 0d 08 70 10 00    	mov    0x107008,%ecx
  101616:	66 89 14 41          	mov    %dx,(%ecx,%eax,2)
  10161a:	c3                   	ret    
  10161b:	90                   	nop
  10161c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00101620 <vga_set_cursor>:
}

void vga_set_cursor(u32 x, u32 y)
{
  101620:	8b 44 24 08          	mov    0x8(%esp),%eax
  101624:	ba d4 03 00 00       	mov    $0x3d4,%edx
    u16 cursorLocation = y * 80 + x;
  101629:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  101630:	01 c1                	add    %eax,%ecx
  101632:	b8 0e 00 00 00       	mov    $0xe,%eax
  101637:	c1 e1 04             	shl    $0x4,%ecx
  10163a:	66 03 4c 24 04       	add    0x4(%esp),%cx
  10163f:	ee                   	out    %al,(%dx)
    outb(0x3D4, 14);                  // Tell the VGA board we are setting the high cursor byte.
    outb(0x3D5, cursorLocation >> 8); // Send the high cursor byte.
  101640:	89 c8                	mov    %ecx,%eax
  101642:	ba d5 03 00 00       	mov    $0x3d5,%edx
  101647:	66 c1 e8 08          	shr    $0x8,%ax
  10164b:	ee                   	out    %al,(%dx)
  10164c:	ba d4 03 00 00       	mov    $0x3d4,%edx
  101651:	b8 0f 00 00 00       	mov    $0xf,%eax
  101656:	ee                   	out    %al,(%dx)
  101657:	ba d5 03 00 00       	mov    $0x3d5,%edx
  10165c:	89 c8                	mov    %ecx,%eax
  10165e:	ee                   	out    %al,(%dx)
  10165f:	c3                   	ret    

00101660 <keyboard_interrupt>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101660:	ba 60 00 00 00       	mov    $0x60,%edx
  101665:	ec                   	in     (%dx),%al
void keyboard_interrupt(registry_t* reg)
{
    UNUSED(reg);
    u8 scancode = inb(0x60) - 1;

    if (scancode < 0x80) 
  101666:	89 c2                	mov    %eax,%edx
  101668:	80 ea 01             	sub    $0x1,%dl
  10166b:	78 33                	js     1016a0 <keyboard_interrupt+0x40>
    {         /* touche enfoncée */
        switch (scancode) 
  10166d:	80 fa 29             	cmp    $0x29,%dl
  101670:	0f 84 ca 00 00 00    	je     101740 <keyboard_interrupt+0xe0>
  101676:	76 18                	jbe    101690 <keyboard_interrupt+0x30>
  101678:	80 fa 35             	cmp    $0x35,%dl
  10167b:	0f 84 af 00 00 00    	je     101730 <keyboard_interrupt+0xd0>
  101681:	80 fa 37             	cmp    $0x37,%dl
  101684:	75 5a                	jne    1016e0 <keyboard_interrupt+0x80>
                break;
            case 0x1C:
                ctrl_enable = true;
                break;
            case 0x37:
                alt_enable = true;
  101686:	c6 05 b6 94 10 00 01 	movb   $0x1,0x1094b6
                break;
  10168d:	c3                   	ret    
  10168e:	66 90                	xchg   %ax,%ax
        switch (scancode) 
  101690:	80 fa 1c             	cmp    $0x1c,%dl
  101693:	75 4b                	jne    1016e0 <keyboard_interrupt+0x80>
                ctrl_enable = true;
  101695:	c6 05 b4 94 10 00 01 	movb   $0x1,0x1094b4
                break;
  10169c:	c3                   	ret    
  10169d:	8d 76 00             	lea    0x0(%esi),%esi
                kprintf("%c", kbdmap_us[scancode * 4 + (lshift_enable || rshift_enable)]);
        }
    }
    else
    {                /* touche relâchée */
        scancode -= 0x80;
  1016a0:	83 c0 7f             	add    $0x7f,%eax
        switch (scancode) 
  1016a3:	3c 29                	cmp    $0x29,%al
  1016a5:	0f 84 a5 00 00 00    	je     101750 <keyboard_interrupt+0xf0>
  1016ab:	76 23                	jbe    1016d0 <keyboard_interrupt+0x70>
  1016ad:	3c 35                	cmp    $0x35,%al
  1016af:	0f 84 ab 00 00 00    	je     101760 <keyboard_interrupt+0x100>
  1016b5:	3c 37                	cmp    $0x37,%al
  1016b7:	0f 85 b3 00 00 00    	jne    101770 <keyboard_interrupt+0x110>
                    break;
            case 0x1C:
                    ctrl_enable = false;
                    break;
            case 0x37:
                    alt_enable = false;
  1016bd:	c6 05 b6 94 10 00 00 	movb   $0x0,0x1094b6
                    break;
        }
    }
  1016c4:	c3                   	ret    
  1016c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1016c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        switch (scancode) 
  1016d0:	3c 1c                	cmp    $0x1c,%al
  1016d2:	0f 85 a8 00 00 00    	jne    101780 <keyboard_interrupt+0x120>
                    ctrl_enable = false;
  1016d8:	c6 05 b4 94 10 00 00 	movb   $0x0,0x1094b4
                    break;
  1016df:	c3                   	ret    
        switch (scancode) 
  1016e0:	0f b6 d2             	movzbl %dl,%edx
{
  1016e3:	83 ec 0c             	sub    $0xc,%esp
  1016e6:	b8 01 00 00 00       	mov    $0x1,%eax
                kprintf("%c", kbdmap_us[scancode * 4 + (lshift_enable || rshift_enable)]);
  1016eb:	c1 e2 02             	shl    $0x2,%edx
  1016ee:	80 3d b5 94 10 00 00 	cmpb   $0x0,0x1094b5
  1016f5:	75 0a                	jne    101701 <keyboard_interrupt+0xa1>
  1016f7:	80 3d b7 94 10 00 00 	cmpb   $0x0,0x1094b7
  1016fe:	0f 95 c0             	setne  %al
  101701:	0f b6 c0             	movzbl %al,%eax
  101704:	83 ec 08             	sub    $0x8,%esp
  101707:	0f b6 84 02 20 70 10 	movzbl 0x107020(%edx,%eax,1),%eax
  10170e:	00 
  10170f:	50                   	push   %eax
  101710:	68 68 62 10 00       	push   $0x106268
  101715:	e8 d6 ef ff ff       	call   1006f0 <kprintf>
  10171a:	83 c4 10             	add    $0x10,%esp
  10171d:	83 c4 0c             	add    $0xc,%esp
  101720:	c3                   	ret    
  101721:	eb 0d                	jmp    101730 <keyboard_interrupt+0xd0>
  101723:	90                   	nop
  101724:	90                   	nop
  101725:	90                   	nop
  101726:	90                   	nop
  101727:	90                   	nop
  101728:	90                   	nop
  101729:	90                   	nop
  10172a:	90                   	nop
  10172b:	90                   	nop
  10172c:	90                   	nop
  10172d:	90                   	nop
  10172e:	90                   	nop
  10172f:	90                   	nop
                rshift_enable = true;
  101730:	c6 05 b7 94 10 00 01 	movb   $0x1,0x1094b7
                break;
  101737:	c3                   	ret    
  101738:	90                   	nop
  101739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                lshift_enable = true;
  101740:	c6 05 b5 94 10 00 01 	movb   $0x1,0x1094b5
                break;
  101747:	c3                   	ret    
  101748:	90                   	nop
  101749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                    lshift_enable = false;
  101750:	c6 05 b5 94 10 00 00 	movb   $0x0,0x1094b5
                    break;
  101757:	c3                   	ret    
  101758:	90                   	nop
  101759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                    rshift_enable = false;
  101760:	c6 05 b7 94 10 00 00 	movb   $0x0,0x1094b7
                    break;
  101767:	c3                   	ret    
  101768:	90                   	nop
  101769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101770:	f3 c3                	repz ret 
  101772:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  101780:	f3 c3                	repz ret 
  101782:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101790 <install_keyboard>:
{
  101790:	83 ec 14             	sub    $0x14,%esp
    add_interrupts_handler(33, &keyboard_interrupt);    
  101793:	68 60 16 10 00       	push   $0x101660
  101798:	6a 21                	push   $0x21
  10179a:	e8 b1 f1 ff ff       	call   100950 <add_interrupts_handler>
}
  10179f:	b8 01 00 00 00       	mov    $0x1,%eax
  1017a4:	83 c4 1c             	add    $0x1c,%esp
  1017a7:	c3                   	ret    
  1017a8:	66 90                	xchg   %ax,%ax
  1017aa:	66 90                	xchg   %ax,%ax
  1017ac:	66 90                	xchg   %ax,%ax
  1017ae:	66 90                	xchg   %ax,%ax

001017b0 <install_uart>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1017b0:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1017b5:	31 c0                	xor    %eax,%eax
  1017b7:	ee                   	out    %al,(%dx)
  1017b8:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1017bd:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  1017c2:	ee                   	out    %al,(%dx)
  1017c3:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1017c8:	b8 03 00 00 00       	mov    $0x3,%eax
  1017cd:	ee                   	out    %al,(%dx)
  1017ce:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1017d3:	31 c0                	xor    %eax,%eax
  1017d5:	ee                   	out    %al,(%dx)
  1017d6:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1017db:	b8 03 00 00 00       	mov    $0x3,%eax
  1017e0:	ee                   	out    %al,(%dx)
  1017e1:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1017e6:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  1017eb:	ee                   	out    %al,(%dx)
  1017ec:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1017f1:	b8 0b 00 00 00       	mov    $0xb,%eax
  1017f6:	ee                   	out    %al,(%dx)
  1017f7:	ba f9 02 00 00       	mov    $0x2f9,%edx
  1017fc:	31 c0                	xor    %eax,%eax
  1017fe:	ee                   	out    %al,(%dx)
  1017ff:	ba fb 02 00 00       	mov    $0x2fb,%edx
  101804:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  101809:	ee                   	out    %al,(%dx)
  10180a:	ba f8 02 00 00       	mov    $0x2f8,%edx
  10180f:	b8 03 00 00 00       	mov    $0x3,%eax
  101814:	ee                   	out    %al,(%dx)
  101815:	ba f9 02 00 00       	mov    $0x2f9,%edx
  10181a:	31 c0                	xor    %eax,%eax
  10181c:	ee                   	out    %al,(%dx)
  10181d:	ba fb 02 00 00       	mov    $0x2fb,%edx
  101822:	b8 03 00 00 00       	mov    $0x3,%eax
  101827:	ee                   	out    %al,(%dx)
  101828:	ba fa 02 00 00       	mov    $0x2fa,%edx
  10182d:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  101832:	ee                   	out    %al,(%dx)
  101833:	ba fc 02 00 00       	mov    $0x2fc,%edx
  101838:	b8 0b 00 00 00       	mov    $0xb,%eax
  10183d:	ee                   	out    %al,(%dx)
  10183e:	ba e9 03 00 00       	mov    $0x3e9,%edx
  101843:	31 c0                	xor    %eax,%eax
  101845:	ee                   	out    %al,(%dx)
  101846:	ba eb 03 00 00       	mov    $0x3eb,%edx
  10184b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  101850:	ee                   	out    %al,(%dx)
  101851:	ba e8 03 00 00       	mov    $0x3e8,%edx
  101856:	b8 03 00 00 00       	mov    $0x3,%eax
  10185b:	ee                   	out    %al,(%dx)
  10185c:	ba e9 03 00 00       	mov    $0x3e9,%edx
  101861:	31 c0                	xor    %eax,%eax
  101863:	ee                   	out    %al,(%dx)
  101864:	ba eb 03 00 00       	mov    $0x3eb,%edx
  101869:	b8 03 00 00 00       	mov    $0x3,%eax
  10186e:	ee                   	out    %al,(%dx)
  10186f:	ba ea 03 00 00       	mov    $0x3ea,%edx
  101874:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  101879:	ee                   	out    %al,(%dx)
  10187a:	ba ec 03 00 00       	mov    $0x3ec,%edx
  10187f:	b8 0b 00 00 00       	mov    $0xb,%eax
  101884:	ee                   	out    %al,(%dx)
  101885:	ba e9 02 00 00       	mov    $0x2e9,%edx
  10188a:	31 c0                	xor    %eax,%eax
  10188c:	ee                   	out    %al,(%dx)
  10188d:	ba eb 02 00 00       	mov    $0x2eb,%edx
  101892:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  101897:	ee                   	out    %al,(%dx)
  101898:	ba e8 02 00 00       	mov    $0x2e8,%edx
  10189d:	b8 03 00 00 00       	mov    $0x3,%eax
  1018a2:	ee                   	out    %al,(%dx)
  1018a3:	ba e9 02 00 00       	mov    $0x2e9,%edx
  1018a8:	31 c0                	xor    %eax,%eax
  1018aa:	ee                   	out    %al,(%dx)
  1018ab:	ba eb 02 00 00       	mov    $0x2eb,%edx
  1018b0:	b8 03 00 00 00       	mov    $0x3,%eax
  1018b5:	ee                   	out    %al,(%dx)
  1018b6:	ba ea 02 00 00       	mov    $0x2ea,%edx
  1018bb:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
  1018c0:	ee                   	out    %al,(%dx)
  1018c1:	ba ec 02 00 00       	mov    $0x2ec,%edx
  1018c6:	b8 0b 00 00 00       	mov    $0xb,%eax
  1018cb:	ee                   	out    %al,(%dx)
    uart_open_port(COM2);
    uart_open_port(COM3);
    uart_open_port(COM4);

    return true;
}
  1018cc:	b8 01 00 00 00       	mov    $0x1,%eax
  1018d1:	c3                   	ret    
  1018d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1018d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001018e0 <uart_open_port>:

void uart_open_port(u16 port)
{
  1018e0:	56                   	push   %esi
  1018e1:	53                   	push   %ebx
  1018e2:	31 c0                	xor    %eax,%eax
  1018e4:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
   outb(port + 1, 0x00);    // Disable all interrupts
  1018e8:	8d 71 01             	lea    0x1(%ecx),%esi
  1018eb:	89 f2                	mov    %esi,%edx
  1018ed:	ee                   	out    %al,(%dx)
   outb(port + 3, 0x80);    // Enable DLAB (set baud rate divisor)
  1018ee:	8d 59 03             	lea    0x3(%ecx),%ebx
  1018f1:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  1018f6:	89 da                	mov    %ebx,%edx
  1018f8:	ee                   	out    %al,(%dx)
  1018f9:	b8 03 00 00 00       	mov    $0x3,%eax
  1018fe:	89 ca                	mov    %ecx,%edx
  101900:	ee                   	out    %al,(%dx)
  101901:	31 c0                	xor    %eax,%eax
  101903:	89 f2                	mov    %esi,%edx
  101905:	ee                   	out    %al,(%dx)
  101906:	b8 03 00 00 00       	mov    $0x3,%eax
  10190b:	89 da                	mov    %ebx,%edx
  10190d:	ee                   	out    %al,(%dx)
  10190e:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
   outb(port + 0, 0x03);    // Set divisor to 3 (lo byte) 38400 baud
   outb(port + 1, 0x00);    //                  (hi byte)
   outb(port + 3, 0x03);    // 8 bits, no parity, one stop bit
   outb(port + 2, 0xC7);    // Enable FIFO, clear them, with 14-byte threshold
  101913:	8d 51 02             	lea    0x2(%ecx),%edx
  101916:	ee                   	out    %al,(%dx)
  101917:	b8 0b 00 00 00       	mov    $0xb,%eax
   outb(port + 4, 0x0B);    // IRQs enabled, RTS/DSR set
  10191c:	8d 51 04             	lea    0x4(%ecx),%edx
  10191f:	ee                   	out    %al,(%dx)
}
  101920:	5b                   	pop    %ebx
  101921:	5e                   	pop    %esi
  101922:	c3                   	ret    
  101923:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101930 <uart_is_transmit_empty>:

int uart_is_transmit_empty(uart_port_t port)
{
   return inb(port + 5) & 0x20;
  101930:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  101935:	8d 50 05             	lea    0x5(%eax),%edx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  101938:	ec                   	in     (%dx),%al
  101939:	83 e0 20             	and    $0x20,%eax
  10193c:	0f b6 c0             	movzbl %al,%eax
}
  10193f:	c3                   	ret    

00101940 <uart_put>:
 
void uart_put(uart_port_t port, char a) 
{
  101940:	53                   	push   %ebx
  101941:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  101945:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  101949:	8d 51 05             	lea    0x5(%ecx),%edx
  10194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101950:	ec                   	in     (%dx),%al
   while (uart_is_transmit_empty(port) == 0);
  101951:	a8 20                	test   $0x20,%al
  101953:	74 fb                	je     101950 <uart_put+0x10>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  101955:	89 d8                	mov    %ebx,%eax
  101957:	89 ca                	mov    %ecx,%edx
  101959:	ee                   	out    %al,(%dx)
 
   outb(port,a);
}
  10195a:	5b                   	pop    %ebx
  10195b:	c3                   	ret    
  10195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00101960 <uart_print>:

void uart_print(uart_port_t port, string str) 
{   
  101960:	55                   	push   %ebp
  101961:	57                   	push   %edi
  101962:	56                   	push   %esi
  101963:	53                   	push   %ebx
  101964:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  101968:	0f b7 6c 24 14       	movzwl 0x14(%esp),%ebp
    bool wait_for_color = false;
    for(u32 i = 0; str[i] != '\0'; i++)
  10196d:	0f b6 0b             	movzbl (%ebx),%ecx
  101970:	84 c9                	test   %cl,%cl
  101972:	74 3a                	je     1019ae <uart_print+0x4e>
  101974:	83 c3 01             	add    $0x1,%ebx
  101977:	31 ff                	xor    %edi,%edi
  101979:	8d 75 05             	lea    0x5(%ebp),%esi
  10197c:	eb 18                	jmp    101996 <uart_print+0x36>
  10197e:	66 90                	xchg   %ax,%ax
    {
        char c = str[i];

        // Strip color control for the console.
        if (c == ASCII_AND && !wait_for_color)
  101980:	89 f8                	mov    %edi,%eax
  101982:	84 c0                	test   %al,%al
  101984:	75 15                	jne    10199b <uart_print+0x3b>
        {
            wait_for_color = true;
  101986:	bf 01 00 00 00       	mov    $0x1,%edi
  10198b:	83 c3 01             	add    $0x1,%ebx
    for(u32 i = 0; str[i] != '\0'; i++)
  10198e:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
  101992:	84 c9                	test   %cl,%cl
  101994:	74 18                	je     1019ae <uart_print+0x4e>
        if (c == ASCII_AND && !wait_for_color)
  101996:	80 f9 26             	cmp    $0x26,%cl
  101999:	74 e5                	je     101980 <uart_print+0x20>
        }
        else if (wait_for_color)
  10199b:	89 f8                	mov    %edi,%eax
  10199d:	84 c0                	test   %al,%al
  10199f:	74 1f                	je     1019c0 <uart_print+0x60>
  1019a1:	83 c3 01             	add    $0x1,%ebx
    for(u32 i = 0; str[i] != '\0'; i++)
  1019a4:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
        {
            wait_for_color = false;
  1019a8:	31 ff                	xor    %edi,%edi
    for(u32 i = 0; str[i] != '\0'; i++)
  1019aa:	84 c9                	test   %cl,%cl
  1019ac:	75 e8                	jne    101996 <uart_print+0x36>
        {
            uart_put(port, c);
        }

    }
  1019ae:	5b                   	pop    %ebx
  1019af:	5e                   	pop    %esi
  1019b0:	5f                   	pop    %edi
  1019b1:	5d                   	pop    %ebp
  1019b2:	c3                   	ret    
  1019b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1019b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1019c0:	89 f2                	mov    %esi,%edx
  1019c2:	ec                   	in     (%dx),%al
   while (uart_is_transmit_empty(port) == 0);
  1019c3:	a8 20                	test   $0x20,%al
  1019c5:	74 f9                	je     1019c0 <uart_print+0x60>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1019c7:	89 c8                	mov    %ecx,%eax
  1019c9:	89 ea                	mov    %ebp,%edx
  1019cb:	ee                   	out    %al,(%dx)
  1019cc:	eb bd                	jmp    10198b <uart_print+0x2b>
  1019ce:	66 90                	xchg   %ax,%ax

001019d0 <clock_interrupt>:
}

void clock_interrupt(registry_t* reg)
{
    UNUSED(reg);
    clock_tick++;
  1019d0:	a1 b8 94 10 00       	mov    0x1094b8,%eax



    if (clock_tick % 1000 == 0)
  1019d5:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    clock_tick++;
  1019da:	8d 48 01             	lea    0x1(%eax),%ecx
    if (clock_tick % 1000 == 0)
  1019dd:	89 c8                	mov    %ecx,%eax
    clock_tick++;
  1019df:	89 0d b8 94 10 00    	mov    %ecx,0x1094b8
    if (clock_tick % 1000 == 0)
  1019e5:	f7 e2                	mul    %edx
  1019e7:	89 d0                	mov    %edx,%eax
  1019e9:	c1 e8 06             	shr    $0x6,%eax
  1019ec:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  1019f2:	39 c1                	cmp    %eax,%ecx
  1019f4:	74 2a                	je     101a20 <clock_interrupt+0x50>
    {
        kprintf("&4tack\t&f");
    }
    else if (clock_tick % 500 == 0)
  1019f6:	c1 ea 05             	shr    $0x5,%edx
  1019f9:	69 d2 f4 01 00 00    	imul   $0x1f4,%edx,%edx
  1019ff:	39 d1                	cmp    %edx,%ecx
  101a01:	74 0d                	je     101a10 <clock_interrupt+0x40>
  101a03:	f3 c3                	repz ret 
  101a05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
        kprintf("&2tick\t&f");
  101a10:	c7 44 24 04 75 62 10 	movl   $0x106275,0x4(%esp)
  101a17:	00 
  101a18:	e9 d3 ec ff ff       	jmp    1006f0 <kprintf>
  101a1d:	8d 76 00             	lea    0x0(%esi),%esi
        kprintf("&4tack\t&f");
  101a20:	c7 44 24 04 6b 62 10 	movl   $0x10626b,0x4(%esp)
  101a27:	00 
  101a28:	e9 c3 ec ff ff       	jmp    1006f0 <kprintf>
  101a2d:	8d 76 00             	lea    0x0(%esi),%esi

00101a30 <install_clock>:
{
  101a30:	83 ec 14             	sub    $0x14,%esp
    add_interrupts_handler(32, &clock_interrupt);
  101a33:	68 d0 19 10 00       	push   $0x1019d0
  101a38:	6a 20                	push   $0x20
  101a3a:	e8 11 ef ff ff       	call   100950 <add_interrupts_handler>
    u32 divisor = 1193180 / frequency;
  101a3f:	31 d2                	xor    %edx,%edx
  101a41:	b8 dc 34 12 00       	mov    $0x1234dc,%eax
  101a46:	f7 35 a8 71 10 00    	divl   0x1071a8
  101a4c:	ba 43 00 00 00       	mov    $0x43,%edx
  101a51:	89 c1                	mov    %eax,%ecx
  101a53:	b8 36 00 00 00       	mov    $0x36,%eax
  101a58:	ee                   	out    %al,(%dx)
  101a59:	ba 40 00 00 00       	mov    $0x40,%edx
  101a5e:	89 c8                	mov    %ecx,%eax
  101a60:	ee                   	out    %al,(%dx)
    u8 h = (u8)( (divisor>>8) & 0xFF );
  101a61:	89 c8                	mov    %ecx,%eax
  101a63:	c1 e8 08             	shr    $0x8,%eax
  101a66:	ee                   	out    %al,(%dx)
}
  101a67:	b8 01 00 00 00       	mov    $0x1,%eax
  101a6c:	83 c4 1c             	add    $0x1c,%esp
  101a6f:	c3                   	ret    

00101a70 <int_handler0>:
  101a70:	fa                   	cli    
  101a71:	60                   	pusha  
  101a72:	1e                   	push   %ds
  101a73:	06                   	push   %es
  101a74:	0f a0                	push   %fs
  101a76:	0f a8                	push   %gs
  101a78:	53                   	push   %ebx
  101a79:	66 bb 10 00          	mov    $0x10,%bx
  101a7d:	8e db                	mov    %ebx,%ds
  101a7f:	5b                   	pop    %ebx
  101a80:	6a 00                	push   $0x0
  101a82:	6a 00                	push   $0x0
  101a84:	e8 47 ed ff ff       	call   1007d0 <interrupt_handler>
  101a89:	83 c4 08             	add    $0x8,%esp
  101a8c:	0f a9                	pop    %gs
  101a8e:	0f a1                	pop    %fs
  101a90:	07                   	pop    %es
  101a91:	1f                   	pop    %ds
  101a92:	61                   	popa   
  101a93:	fb                   	sti    
  101a94:	cf                   	iret   

00101a95 <int_handler1>:
  101a95:	fa                   	cli    
  101a96:	60                   	pusha  
  101a97:	1e                   	push   %ds
  101a98:	06                   	push   %es
  101a99:	0f a0                	push   %fs
  101a9b:	0f a8                	push   %gs
  101a9d:	53                   	push   %ebx
  101a9e:	66 bb 10 00          	mov    $0x10,%bx
  101aa2:	8e db                	mov    %ebx,%ds
  101aa4:	5b                   	pop    %ebx
  101aa5:	6a 00                	push   $0x0
  101aa7:	6a 01                	push   $0x1
  101aa9:	e8 22 ed ff ff       	call   1007d0 <interrupt_handler>
  101aae:	83 c4 08             	add    $0x8,%esp
  101ab1:	0f a9                	pop    %gs
  101ab3:	0f a1                	pop    %fs
  101ab5:	07                   	pop    %es
  101ab6:	1f                   	pop    %ds
  101ab7:	61                   	popa   
  101ab8:	fb                   	sti    
  101ab9:	cf                   	iret   

00101aba <int_handler2>:
  101aba:	fa                   	cli    
  101abb:	60                   	pusha  
  101abc:	1e                   	push   %ds
  101abd:	06                   	push   %es
  101abe:	0f a0                	push   %fs
  101ac0:	0f a8                	push   %gs
  101ac2:	53                   	push   %ebx
  101ac3:	66 bb 10 00          	mov    $0x10,%bx
  101ac7:	8e db                	mov    %ebx,%ds
  101ac9:	5b                   	pop    %ebx
  101aca:	6a 00                	push   $0x0
  101acc:	6a 02                	push   $0x2
  101ace:	e8 fd ec ff ff       	call   1007d0 <interrupt_handler>
  101ad3:	83 c4 08             	add    $0x8,%esp
  101ad6:	0f a9                	pop    %gs
  101ad8:	0f a1                	pop    %fs
  101ada:	07                   	pop    %es
  101adb:	1f                   	pop    %ds
  101adc:	61                   	popa   
  101add:	fb                   	sti    
  101ade:	cf                   	iret   

00101adf <int_handler3>:
  101adf:	fa                   	cli    
  101ae0:	60                   	pusha  
  101ae1:	1e                   	push   %ds
  101ae2:	06                   	push   %es
  101ae3:	0f a0                	push   %fs
  101ae5:	0f a8                	push   %gs
  101ae7:	53                   	push   %ebx
  101ae8:	66 bb 10 00          	mov    $0x10,%bx
  101aec:	8e db                	mov    %ebx,%ds
  101aee:	5b                   	pop    %ebx
  101aef:	6a 00                	push   $0x0
  101af1:	6a 03                	push   $0x3
  101af3:	e8 d8 ec ff ff       	call   1007d0 <interrupt_handler>
  101af8:	83 c4 08             	add    $0x8,%esp
  101afb:	0f a9                	pop    %gs
  101afd:	0f a1                	pop    %fs
  101aff:	07                   	pop    %es
  101b00:	1f                   	pop    %ds
  101b01:	61                   	popa   
  101b02:	fb                   	sti    
  101b03:	cf                   	iret   

00101b04 <int_handler4>:
  101b04:	fa                   	cli    
  101b05:	60                   	pusha  
  101b06:	1e                   	push   %ds
  101b07:	06                   	push   %es
  101b08:	0f a0                	push   %fs
  101b0a:	0f a8                	push   %gs
  101b0c:	53                   	push   %ebx
  101b0d:	66 bb 10 00          	mov    $0x10,%bx
  101b11:	8e db                	mov    %ebx,%ds
  101b13:	5b                   	pop    %ebx
  101b14:	6a 00                	push   $0x0
  101b16:	6a 04                	push   $0x4
  101b18:	e8 b3 ec ff ff       	call   1007d0 <interrupt_handler>
  101b1d:	83 c4 08             	add    $0x8,%esp
  101b20:	0f a9                	pop    %gs
  101b22:	0f a1                	pop    %fs
  101b24:	07                   	pop    %es
  101b25:	1f                   	pop    %ds
  101b26:	61                   	popa   
  101b27:	fb                   	sti    
  101b28:	cf                   	iret   

00101b29 <int_handler5>:
  101b29:	fa                   	cli    
  101b2a:	60                   	pusha  
  101b2b:	1e                   	push   %ds
  101b2c:	06                   	push   %es
  101b2d:	0f a0                	push   %fs
  101b2f:	0f a8                	push   %gs
  101b31:	53                   	push   %ebx
  101b32:	66 bb 10 00          	mov    $0x10,%bx
  101b36:	8e db                	mov    %ebx,%ds
  101b38:	5b                   	pop    %ebx
  101b39:	6a 00                	push   $0x0
  101b3b:	6a 05                	push   $0x5
  101b3d:	e8 8e ec ff ff       	call   1007d0 <interrupt_handler>
  101b42:	83 c4 08             	add    $0x8,%esp
  101b45:	0f a9                	pop    %gs
  101b47:	0f a1                	pop    %fs
  101b49:	07                   	pop    %es
  101b4a:	1f                   	pop    %ds
  101b4b:	61                   	popa   
  101b4c:	fb                   	sti    
  101b4d:	cf                   	iret   

00101b4e <int_handler6>:
  101b4e:	fa                   	cli    
  101b4f:	60                   	pusha  
  101b50:	1e                   	push   %ds
  101b51:	06                   	push   %es
  101b52:	0f a0                	push   %fs
  101b54:	0f a8                	push   %gs
  101b56:	53                   	push   %ebx
  101b57:	66 bb 10 00          	mov    $0x10,%bx
  101b5b:	8e db                	mov    %ebx,%ds
  101b5d:	5b                   	pop    %ebx
  101b5e:	6a 00                	push   $0x0
  101b60:	6a 06                	push   $0x6
  101b62:	e8 69 ec ff ff       	call   1007d0 <interrupt_handler>
  101b67:	83 c4 08             	add    $0x8,%esp
  101b6a:	0f a9                	pop    %gs
  101b6c:	0f a1                	pop    %fs
  101b6e:	07                   	pop    %es
  101b6f:	1f                   	pop    %ds
  101b70:	61                   	popa   
  101b71:	fb                   	sti    
  101b72:	cf                   	iret   

00101b73 <int_handler7>:
  101b73:	fa                   	cli    
  101b74:	60                   	pusha  
  101b75:	1e                   	push   %ds
  101b76:	06                   	push   %es
  101b77:	0f a0                	push   %fs
  101b79:	0f a8                	push   %gs
  101b7b:	53                   	push   %ebx
  101b7c:	66 bb 10 00          	mov    $0x10,%bx
  101b80:	8e db                	mov    %ebx,%ds
  101b82:	5b                   	pop    %ebx
  101b83:	6a 00                	push   $0x0
  101b85:	6a 07                	push   $0x7
  101b87:	e8 44 ec ff ff       	call   1007d0 <interrupt_handler>
  101b8c:	83 c4 08             	add    $0x8,%esp
  101b8f:	0f a9                	pop    %gs
  101b91:	0f a1                	pop    %fs
  101b93:	07                   	pop    %es
  101b94:	1f                   	pop    %ds
  101b95:	61                   	popa   
  101b96:	fb                   	sti    
  101b97:	cf                   	iret   

00101b98 <int_handler8>:
  101b98:	fa                   	cli    
  101b99:	60                   	pusha  
  101b9a:	1e                   	push   %ds
  101b9b:	06                   	push   %es
  101b9c:	0f a0                	push   %fs
  101b9e:	0f a8                	push   %gs
  101ba0:	53                   	push   %ebx
  101ba1:	66 bb 10 00          	mov    $0x10,%bx
  101ba5:	8e db                	mov    %ebx,%ds
  101ba7:	5b                   	pop    %ebx
  101ba8:	6a 08                	push   $0x8
  101baa:	e8 21 ec ff ff       	call   1007d0 <interrupt_handler>
  101baf:	83 c4 08             	add    $0x8,%esp
  101bb2:	0f a9                	pop    %gs
  101bb4:	0f a1                	pop    %fs
  101bb6:	07                   	pop    %es
  101bb7:	1f                   	pop    %ds
  101bb8:	61                   	popa   
  101bb9:	fb                   	sti    
  101bba:	cf                   	iret   

00101bbb <int_handler9>:
  101bbb:	fa                   	cli    
  101bbc:	60                   	pusha  
  101bbd:	1e                   	push   %ds
  101bbe:	06                   	push   %es
  101bbf:	0f a0                	push   %fs
  101bc1:	0f a8                	push   %gs
  101bc3:	53                   	push   %ebx
  101bc4:	66 bb 10 00          	mov    $0x10,%bx
  101bc8:	8e db                	mov    %ebx,%ds
  101bca:	5b                   	pop    %ebx
  101bcb:	6a 00                	push   $0x0
  101bcd:	6a 09                	push   $0x9
  101bcf:	e8 fc eb ff ff       	call   1007d0 <interrupt_handler>
  101bd4:	83 c4 08             	add    $0x8,%esp
  101bd7:	0f a9                	pop    %gs
  101bd9:	0f a1                	pop    %fs
  101bdb:	07                   	pop    %es
  101bdc:	1f                   	pop    %ds
  101bdd:	61                   	popa   
  101bde:	fb                   	sti    
  101bdf:	cf                   	iret   

00101be0 <int_handler10>:
  101be0:	fa                   	cli    
  101be1:	60                   	pusha  
  101be2:	1e                   	push   %ds
  101be3:	06                   	push   %es
  101be4:	0f a0                	push   %fs
  101be6:	0f a8                	push   %gs
  101be8:	53                   	push   %ebx
  101be9:	66 bb 10 00          	mov    $0x10,%bx
  101bed:	8e db                	mov    %ebx,%ds
  101bef:	5b                   	pop    %ebx
  101bf0:	6a 0a                	push   $0xa
  101bf2:	e8 d9 eb ff ff       	call   1007d0 <interrupt_handler>
  101bf7:	83 c4 08             	add    $0x8,%esp
  101bfa:	0f a9                	pop    %gs
  101bfc:	0f a1                	pop    %fs
  101bfe:	07                   	pop    %es
  101bff:	1f                   	pop    %ds
  101c00:	61                   	popa   
  101c01:	fb                   	sti    
  101c02:	cf                   	iret   

00101c03 <int_handler11>:
  101c03:	fa                   	cli    
  101c04:	60                   	pusha  
  101c05:	1e                   	push   %ds
  101c06:	06                   	push   %es
  101c07:	0f a0                	push   %fs
  101c09:	0f a8                	push   %gs
  101c0b:	53                   	push   %ebx
  101c0c:	66 bb 10 00          	mov    $0x10,%bx
  101c10:	8e db                	mov    %ebx,%ds
  101c12:	5b                   	pop    %ebx
  101c13:	6a 0b                	push   $0xb
  101c15:	e8 b6 eb ff ff       	call   1007d0 <interrupt_handler>
  101c1a:	83 c4 08             	add    $0x8,%esp
  101c1d:	0f a9                	pop    %gs
  101c1f:	0f a1                	pop    %fs
  101c21:	07                   	pop    %es
  101c22:	1f                   	pop    %ds
  101c23:	61                   	popa   
  101c24:	fb                   	sti    
  101c25:	cf                   	iret   

00101c26 <int_handler12>:
  101c26:	fa                   	cli    
  101c27:	60                   	pusha  
  101c28:	1e                   	push   %ds
  101c29:	06                   	push   %es
  101c2a:	0f a0                	push   %fs
  101c2c:	0f a8                	push   %gs
  101c2e:	53                   	push   %ebx
  101c2f:	66 bb 10 00          	mov    $0x10,%bx
  101c33:	8e db                	mov    %ebx,%ds
  101c35:	5b                   	pop    %ebx
  101c36:	6a 0c                	push   $0xc
  101c38:	e8 93 eb ff ff       	call   1007d0 <interrupt_handler>
  101c3d:	83 c4 08             	add    $0x8,%esp
  101c40:	0f a9                	pop    %gs
  101c42:	0f a1                	pop    %fs
  101c44:	07                   	pop    %es
  101c45:	1f                   	pop    %ds
  101c46:	61                   	popa   
  101c47:	fb                   	sti    
  101c48:	cf                   	iret   

00101c49 <int_handler13>:
  101c49:	fa                   	cli    
  101c4a:	60                   	pusha  
  101c4b:	1e                   	push   %ds
  101c4c:	06                   	push   %es
  101c4d:	0f a0                	push   %fs
  101c4f:	0f a8                	push   %gs
  101c51:	53                   	push   %ebx
  101c52:	66 bb 10 00          	mov    $0x10,%bx
  101c56:	8e db                	mov    %ebx,%ds
  101c58:	5b                   	pop    %ebx
  101c59:	6a 0d                	push   $0xd
  101c5b:	e8 70 eb ff ff       	call   1007d0 <interrupt_handler>
  101c60:	83 c4 08             	add    $0x8,%esp
  101c63:	0f a9                	pop    %gs
  101c65:	0f a1                	pop    %fs
  101c67:	07                   	pop    %es
  101c68:	1f                   	pop    %ds
  101c69:	61                   	popa   
  101c6a:	fb                   	sti    
  101c6b:	cf                   	iret   

00101c6c <int_handler14>:
  101c6c:	fa                   	cli    
  101c6d:	60                   	pusha  
  101c6e:	1e                   	push   %ds
  101c6f:	06                   	push   %es
  101c70:	0f a0                	push   %fs
  101c72:	0f a8                	push   %gs
  101c74:	53                   	push   %ebx
  101c75:	66 bb 10 00          	mov    $0x10,%bx
  101c79:	8e db                	mov    %ebx,%ds
  101c7b:	5b                   	pop    %ebx
  101c7c:	6a 0e                	push   $0xe
  101c7e:	e8 4d eb ff ff       	call   1007d0 <interrupt_handler>
  101c83:	83 c4 08             	add    $0x8,%esp
  101c86:	0f a9                	pop    %gs
  101c88:	0f a1                	pop    %fs
  101c8a:	07                   	pop    %es
  101c8b:	1f                   	pop    %ds
  101c8c:	61                   	popa   
  101c8d:	fb                   	sti    
  101c8e:	cf                   	iret   

00101c8f <int_handler15>:
  101c8f:	fa                   	cli    
  101c90:	60                   	pusha  
  101c91:	1e                   	push   %ds
  101c92:	06                   	push   %es
  101c93:	0f a0                	push   %fs
  101c95:	0f a8                	push   %gs
  101c97:	53                   	push   %ebx
  101c98:	66 bb 10 00          	mov    $0x10,%bx
  101c9c:	8e db                	mov    %ebx,%ds
  101c9e:	5b                   	pop    %ebx
  101c9f:	6a 00                	push   $0x0
  101ca1:	6a 0f                	push   $0xf
  101ca3:	e8 28 eb ff ff       	call   1007d0 <interrupt_handler>
  101ca8:	83 c4 08             	add    $0x8,%esp
  101cab:	0f a9                	pop    %gs
  101cad:	0f a1                	pop    %fs
  101caf:	07                   	pop    %es
  101cb0:	1f                   	pop    %ds
  101cb1:	61                   	popa   
  101cb2:	fb                   	sti    
  101cb3:	cf                   	iret   

00101cb4 <int_handler16>:
  101cb4:	fa                   	cli    
  101cb5:	60                   	pusha  
  101cb6:	1e                   	push   %ds
  101cb7:	06                   	push   %es
  101cb8:	0f a0                	push   %fs
  101cba:	0f a8                	push   %gs
  101cbc:	53                   	push   %ebx
  101cbd:	66 bb 10 00          	mov    $0x10,%bx
  101cc1:	8e db                	mov    %ebx,%ds
  101cc3:	5b                   	pop    %ebx
  101cc4:	6a 00                	push   $0x0
  101cc6:	6a 10                	push   $0x10
  101cc8:	e8 03 eb ff ff       	call   1007d0 <interrupt_handler>
  101ccd:	83 c4 08             	add    $0x8,%esp
  101cd0:	0f a9                	pop    %gs
  101cd2:	0f a1                	pop    %fs
  101cd4:	07                   	pop    %es
  101cd5:	1f                   	pop    %ds
  101cd6:	61                   	popa   
  101cd7:	fb                   	sti    
  101cd8:	cf                   	iret   

00101cd9 <int_handler17>:
  101cd9:	fa                   	cli    
  101cda:	60                   	pusha  
  101cdb:	1e                   	push   %ds
  101cdc:	06                   	push   %es
  101cdd:	0f a0                	push   %fs
  101cdf:	0f a8                	push   %gs
  101ce1:	53                   	push   %ebx
  101ce2:	66 bb 10 00          	mov    $0x10,%bx
  101ce6:	8e db                	mov    %ebx,%ds
  101ce8:	5b                   	pop    %ebx
  101ce9:	6a 00                	push   $0x0
  101ceb:	6a 11                	push   $0x11
  101ced:	e8 de ea ff ff       	call   1007d0 <interrupt_handler>
  101cf2:	83 c4 08             	add    $0x8,%esp
  101cf5:	0f a9                	pop    %gs
  101cf7:	0f a1                	pop    %fs
  101cf9:	07                   	pop    %es
  101cfa:	1f                   	pop    %ds
  101cfb:	61                   	popa   
  101cfc:	fb                   	sti    
  101cfd:	cf                   	iret   

00101cfe <int_handler18>:
  101cfe:	fa                   	cli    
  101cff:	60                   	pusha  
  101d00:	1e                   	push   %ds
  101d01:	06                   	push   %es
  101d02:	0f a0                	push   %fs
  101d04:	0f a8                	push   %gs
  101d06:	53                   	push   %ebx
  101d07:	66 bb 10 00          	mov    $0x10,%bx
  101d0b:	8e db                	mov    %ebx,%ds
  101d0d:	5b                   	pop    %ebx
  101d0e:	6a 00                	push   $0x0
  101d10:	6a 12                	push   $0x12
  101d12:	e8 b9 ea ff ff       	call   1007d0 <interrupt_handler>
  101d17:	83 c4 08             	add    $0x8,%esp
  101d1a:	0f a9                	pop    %gs
  101d1c:	0f a1                	pop    %fs
  101d1e:	07                   	pop    %es
  101d1f:	1f                   	pop    %ds
  101d20:	61                   	popa   
  101d21:	fb                   	sti    
  101d22:	cf                   	iret   

00101d23 <int_handler19>:
  101d23:	fa                   	cli    
  101d24:	60                   	pusha  
  101d25:	1e                   	push   %ds
  101d26:	06                   	push   %es
  101d27:	0f a0                	push   %fs
  101d29:	0f a8                	push   %gs
  101d2b:	53                   	push   %ebx
  101d2c:	66 bb 10 00          	mov    $0x10,%bx
  101d30:	8e db                	mov    %ebx,%ds
  101d32:	5b                   	pop    %ebx
  101d33:	6a 00                	push   $0x0
  101d35:	6a 13                	push   $0x13
  101d37:	e8 94 ea ff ff       	call   1007d0 <interrupt_handler>
  101d3c:	83 c4 08             	add    $0x8,%esp
  101d3f:	0f a9                	pop    %gs
  101d41:	0f a1                	pop    %fs
  101d43:	07                   	pop    %es
  101d44:	1f                   	pop    %ds
  101d45:	61                   	popa   
  101d46:	fb                   	sti    
  101d47:	cf                   	iret   

00101d48 <int_handler20>:
  101d48:	fa                   	cli    
  101d49:	60                   	pusha  
  101d4a:	1e                   	push   %ds
  101d4b:	06                   	push   %es
  101d4c:	0f a0                	push   %fs
  101d4e:	0f a8                	push   %gs
  101d50:	53                   	push   %ebx
  101d51:	66 bb 10 00          	mov    $0x10,%bx
  101d55:	8e db                	mov    %ebx,%ds
  101d57:	5b                   	pop    %ebx
  101d58:	6a 00                	push   $0x0
  101d5a:	6a 14                	push   $0x14
  101d5c:	e8 6f ea ff ff       	call   1007d0 <interrupt_handler>
  101d61:	83 c4 08             	add    $0x8,%esp
  101d64:	0f a9                	pop    %gs
  101d66:	0f a1                	pop    %fs
  101d68:	07                   	pop    %es
  101d69:	1f                   	pop    %ds
  101d6a:	61                   	popa   
  101d6b:	fb                   	sti    
  101d6c:	cf                   	iret   

00101d6d <int_handler21>:
  101d6d:	fa                   	cli    
  101d6e:	60                   	pusha  
  101d6f:	1e                   	push   %ds
  101d70:	06                   	push   %es
  101d71:	0f a0                	push   %fs
  101d73:	0f a8                	push   %gs
  101d75:	53                   	push   %ebx
  101d76:	66 bb 10 00          	mov    $0x10,%bx
  101d7a:	8e db                	mov    %ebx,%ds
  101d7c:	5b                   	pop    %ebx
  101d7d:	6a 00                	push   $0x0
  101d7f:	6a 15                	push   $0x15
  101d81:	e8 4a ea ff ff       	call   1007d0 <interrupt_handler>
  101d86:	83 c4 08             	add    $0x8,%esp
  101d89:	0f a9                	pop    %gs
  101d8b:	0f a1                	pop    %fs
  101d8d:	07                   	pop    %es
  101d8e:	1f                   	pop    %ds
  101d8f:	61                   	popa   
  101d90:	fb                   	sti    
  101d91:	cf                   	iret   

00101d92 <int_handler22>:
  101d92:	fa                   	cli    
  101d93:	60                   	pusha  
  101d94:	1e                   	push   %ds
  101d95:	06                   	push   %es
  101d96:	0f a0                	push   %fs
  101d98:	0f a8                	push   %gs
  101d9a:	53                   	push   %ebx
  101d9b:	66 bb 10 00          	mov    $0x10,%bx
  101d9f:	8e db                	mov    %ebx,%ds
  101da1:	5b                   	pop    %ebx
  101da2:	6a 00                	push   $0x0
  101da4:	6a 16                	push   $0x16
  101da6:	e8 25 ea ff ff       	call   1007d0 <interrupt_handler>
  101dab:	83 c4 08             	add    $0x8,%esp
  101dae:	0f a9                	pop    %gs
  101db0:	0f a1                	pop    %fs
  101db2:	07                   	pop    %es
  101db3:	1f                   	pop    %ds
  101db4:	61                   	popa   
  101db5:	fb                   	sti    
  101db6:	cf                   	iret   

00101db7 <int_handler23>:
  101db7:	fa                   	cli    
  101db8:	60                   	pusha  
  101db9:	1e                   	push   %ds
  101dba:	06                   	push   %es
  101dbb:	0f a0                	push   %fs
  101dbd:	0f a8                	push   %gs
  101dbf:	53                   	push   %ebx
  101dc0:	66 bb 10 00          	mov    $0x10,%bx
  101dc4:	8e db                	mov    %ebx,%ds
  101dc6:	5b                   	pop    %ebx
  101dc7:	6a 00                	push   $0x0
  101dc9:	6a 17                	push   $0x17
  101dcb:	e8 00 ea ff ff       	call   1007d0 <interrupt_handler>
  101dd0:	83 c4 08             	add    $0x8,%esp
  101dd3:	0f a9                	pop    %gs
  101dd5:	0f a1                	pop    %fs
  101dd7:	07                   	pop    %es
  101dd8:	1f                   	pop    %ds
  101dd9:	61                   	popa   
  101dda:	fb                   	sti    
  101ddb:	cf                   	iret   

00101ddc <int_handler24>:
  101ddc:	fa                   	cli    
  101ddd:	60                   	pusha  
  101dde:	1e                   	push   %ds
  101ddf:	06                   	push   %es
  101de0:	0f a0                	push   %fs
  101de2:	0f a8                	push   %gs
  101de4:	53                   	push   %ebx
  101de5:	66 bb 10 00          	mov    $0x10,%bx
  101de9:	8e db                	mov    %ebx,%ds
  101deb:	5b                   	pop    %ebx
  101dec:	6a 00                	push   $0x0
  101dee:	6a 18                	push   $0x18
  101df0:	e8 db e9 ff ff       	call   1007d0 <interrupt_handler>
  101df5:	83 c4 08             	add    $0x8,%esp
  101df8:	0f a9                	pop    %gs
  101dfa:	0f a1                	pop    %fs
  101dfc:	07                   	pop    %es
  101dfd:	1f                   	pop    %ds
  101dfe:	61                   	popa   
  101dff:	fb                   	sti    
  101e00:	cf                   	iret   

00101e01 <int_handler25>:
  101e01:	fa                   	cli    
  101e02:	60                   	pusha  
  101e03:	1e                   	push   %ds
  101e04:	06                   	push   %es
  101e05:	0f a0                	push   %fs
  101e07:	0f a8                	push   %gs
  101e09:	53                   	push   %ebx
  101e0a:	66 bb 10 00          	mov    $0x10,%bx
  101e0e:	8e db                	mov    %ebx,%ds
  101e10:	5b                   	pop    %ebx
  101e11:	6a 00                	push   $0x0
  101e13:	6a 19                	push   $0x19
  101e15:	e8 b6 e9 ff ff       	call   1007d0 <interrupt_handler>
  101e1a:	83 c4 08             	add    $0x8,%esp
  101e1d:	0f a9                	pop    %gs
  101e1f:	0f a1                	pop    %fs
  101e21:	07                   	pop    %es
  101e22:	1f                   	pop    %ds
  101e23:	61                   	popa   
  101e24:	fb                   	sti    
  101e25:	cf                   	iret   

00101e26 <int_handler26>:
  101e26:	fa                   	cli    
  101e27:	60                   	pusha  
  101e28:	1e                   	push   %ds
  101e29:	06                   	push   %es
  101e2a:	0f a0                	push   %fs
  101e2c:	0f a8                	push   %gs
  101e2e:	53                   	push   %ebx
  101e2f:	66 bb 10 00          	mov    $0x10,%bx
  101e33:	8e db                	mov    %ebx,%ds
  101e35:	5b                   	pop    %ebx
  101e36:	6a 00                	push   $0x0
  101e38:	6a 1a                	push   $0x1a
  101e3a:	e8 91 e9 ff ff       	call   1007d0 <interrupt_handler>
  101e3f:	83 c4 08             	add    $0x8,%esp
  101e42:	0f a9                	pop    %gs
  101e44:	0f a1                	pop    %fs
  101e46:	07                   	pop    %es
  101e47:	1f                   	pop    %ds
  101e48:	61                   	popa   
  101e49:	fb                   	sti    
  101e4a:	cf                   	iret   

00101e4b <int_handler27>:
  101e4b:	fa                   	cli    
  101e4c:	60                   	pusha  
  101e4d:	1e                   	push   %ds
  101e4e:	06                   	push   %es
  101e4f:	0f a0                	push   %fs
  101e51:	0f a8                	push   %gs
  101e53:	53                   	push   %ebx
  101e54:	66 bb 10 00          	mov    $0x10,%bx
  101e58:	8e db                	mov    %ebx,%ds
  101e5a:	5b                   	pop    %ebx
  101e5b:	6a 00                	push   $0x0
  101e5d:	6a 1b                	push   $0x1b
  101e5f:	e8 6c e9 ff ff       	call   1007d0 <interrupt_handler>
  101e64:	83 c4 08             	add    $0x8,%esp
  101e67:	0f a9                	pop    %gs
  101e69:	0f a1                	pop    %fs
  101e6b:	07                   	pop    %es
  101e6c:	1f                   	pop    %ds
  101e6d:	61                   	popa   
  101e6e:	fb                   	sti    
  101e6f:	cf                   	iret   

00101e70 <int_handler28>:
  101e70:	fa                   	cli    
  101e71:	60                   	pusha  
  101e72:	1e                   	push   %ds
  101e73:	06                   	push   %es
  101e74:	0f a0                	push   %fs
  101e76:	0f a8                	push   %gs
  101e78:	53                   	push   %ebx
  101e79:	66 bb 10 00          	mov    $0x10,%bx
  101e7d:	8e db                	mov    %ebx,%ds
  101e7f:	5b                   	pop    %ebx
  101e80:	6a 00                	push   $0x0
  101e82:	6a 1c                	push   $0x1c
  101e84:	e8 47 e9 ff ff       	call   1007d0 <interrupt_handler>
  101e89:	83 c4 08             	add    $0x8,%esp
  101e8c:	0f a9                	pop    %gs
  101e8e:	0f a1                	pop    %fs
  101e90:	07                   	pop    %es
  101e91:	1f                   	pop    %ds
  101e92:	61                   	popa   
  101e93:	fb                   	sti    
  101e94:	cf                   	iret   

00101e95 <int_handler29>:
  101e95:	fa                   	cli    
  101e96:	60                   	pusha  
  101e97:	1e                   	push   %ds
  101e98:	06                   	push   %es
  101e99:	0f a0                	push   %fs
  101e9b:	0f a8                	push   %gs
  101e9d:	53                   	push   %ebx
  101e9e:	66 bb 10 00          	mov    $0x10,%bx
  101ea2:	8e db                	mov    %ebx,%ds
  101ea4:	5b                   	pop    %ebx
  101ea5:	6a 00                	push   $0x0
  101ea7:	6a 1d                	push   $0x1d
  101ea9:	e8 22 e9 ff ff       	call   1007d0 <interrupt_handler>
  101eae:	83 c4 08             	add    $0x8,%esp
  101eb1:	0f a9                	pop    %gs
  101eb3:	0f a1                	pop    %fs
  101eb5:	07                   	pop    %es
  101eb6:	1f                   	pop    %ds
  101eb7:	61                   	popa   
  101eb8:	fb                   	sti    
  101eb9:	cf                   	iret   

00101eba <int_handler30>:
  101eba:	fa                   	cli    
  101ebb:	60                   	pusha  
  101ebc:	1e                   	push   %ds
  101ebd:	06                   	push   %es
  101ebe:	0f a0                	push   %fs
  101ec0:	0f a8                	push   %gs
  101ec2:	53                   	push   %ebx
  101ec3:	66 bb 10 00          	mov    $0x10,%bx
  101ec7:	8e db                	mov    %ebx,%ds
  101ec9:	5b                   	pop    %ebx
  101eca:	6a 00                	push   $0x0
  101ecc:	6a 1e                	push   $0x1e
  101ece:	e8 fd e8 ff ff       	call   1007d0 <interrupt_handler>
  101ed3:	83 c4 08             	add    $0x8,%esp
  101ed6:	0f a9                	pop    %gs
  101ed8:	0f a1                	pop    %fs
  101eda:	07                   	pop    %es
  101edb:	1f                   	pop    %ds
  101edc:	61                   	popa   
  101edd:	fb                   	sti    
  101ede:	cf                   	iret   

00101edf <int_handler31>:
  101edf:	fa                   	cli    
  101ee0:	60                   	pusha  
  101ee1:	1e                   	push   %ds
  101ee2:	06                   	push   %es
  101ee3:	0f a0                	push   %fs
  101ee5:	0f a8                	push   %gs
  101ee7:	53                   	push   %ebx
  101ee8:	66 bb 10 00          	mov    $0x10,%bx
  101eec:	8e db                	mov    %ebx,%ds
  101eee:	5b                   	pop    %ebx
  101eef:	6a 00                	push   $0x0
  101ef1:	6a 1f                	push   $0x1f
  101ef3:	e8 d8 e8 ff ff       	call   1007d0 <interrupt_handler>
  101ef8:	83 c4 08             	add    $0x8,%esp
  101efb:	0f a9                	pop    %gs
  101efd:	0f a1                	pop    %fs
  101eff:	07                   	pop    %es
  101f00:	1f                   	pop    %ds
  101f01:	61                   	popa   
  101f02:	fb                   	sti    
  101f03:	cf                   	iret   

00101f04 <int_handler32>:
  101f04:	fa                   	cli    
  101f05:	60                   	pusha  
  101f06:	1e                   	push   %ds
  101f07:	06                   	push   %es
  101f08:	0f a0                	push   %fs
  101f0a:	0f a8                	push   %gs
  101f0c:	53                   	push   %ebx
  101f0d:	66 bb 10 00          	mov    $0x10,%bx
  101f11:	8e db                	mov    %ebx,%ds
  101f13:	5b                   	pop    %ebx
  101f14:	6a 00                	push   $0x0
  101f16:	6a 20                	push   $0x20
  101f18:	e8 b3 e8 ff ff       	call   1007d0 <interrupt_handler>
  101f1d:	83 c4 08             	add    $0x8,%esp
  101f20:	0f a9                	pop    %gs
  101f22:	0f a1                	pop    %fs
  101f24:	07                   	pop    %es
  101f25:	1f                   	pop    %ds
  101f26:	61                   	popa   
  101f27:	fb                   	sti    
  101f28:	cf                   	iret   

00101f29 <int_handler33>:
  101f29:	fa                   	cli    
  101f2a:	60                   	pusha  
  101f2b:	1e                   	push   %ds
  101f2c:	06                   	push   %es
  101f2d:	0f a0                	push   %fs
  101f2f:	0f a8                	push   %gs
  101f31:	53                   	push   %ebx
  101f32:	66 bb 10 00          	mov    $0x10,%bx
  101f36:	8e db                	mov    %ebx,%ds
  101f38:	5b                   	pop    %ebx
  101f39:	6a 00                	push   $0x0
  101f3b:	6a 21                	push   $0x21
  101f3d:	e8 8e e8 ff ff       	call   1007d0 <interrupt_handler>
  101f42:	83 c4 08             	add    $0x8,%esp
  101f45:	0f a9                	pop    %gs
  101f47:	0f a1                	pop    %fs
  101f49:	07                   	pop    %es
  101f4a:	1f                   	pop    %ds
  101f4b:	61                   	popa   
  101f4c:	fb                   	sti    
  101f4d:	cf                   	iret   

00101f4e <int_handler34>:
  101f4e:	fa                   	cli    
  101f4f:	60                   	pusha  
  101f50:	1e                   	push   %ds
  101f51:	06                   	push   %es
  101f52:	0f a0                	push   %fs
  101f54:	0f a8                	push   %gs
  101f56:	53                   	push   %ebx
  101f57:	66 bb 10 00          	mov    $0x10,%bx
  101f5b:	8e db                	mov    %ebx,%ds
  101f5d:	5b                   	pop    %ebx
  101f5e:	6a 00                	push   $0x0
  101f60:	6a 22                	push   $0x22
  101f62:	e8 69 e8 ff ff       	call   1007d0 <interrupt_handler>
  101f67:	83 c4 08             	add    $0x8,%esp
  101f6a:	0f a9                	pop    %gs
  101f6c:	0f a1                	pop    %fs
  101f6e:	07                   	pop    %es
  101f6f:	1f                   	pop    %ds
  101f70:	61                   	popa   
  101f71:	fb                   	sti    
  101f72:	cf                   	iret   

00101f73 <int_handler35>:
  101f73:	fa                   	cli    
  101f74:	60                   	pusha  
  101f75:	1e                   	push   %ds
  101f76:	06                   	push   %es
  101f77:	0f a0                	push   %fs
  101f79:	0f a8                	push   %gs
  101f7b:	53                   	push   %ebx
  101f7c:	66 bb 10 00          	mov    $0x10,%bx
  101f80:	8e db                	mov    %ebx,%ds
  101f82:	5b                   	pop    %ebx
  101f83:	6a 00                	push   $0x0
  101f85:	6a 23                	push   $0x23
  101f87:	e8 44 e8 ff ff       	call   1007d0 <interrupt_handler>
  101f8c:	83 c4 08             	add    $0x8,%esp
  101f8f:	0f a9                	pop    %gs
  101f91:	0f a1                	pop    %fs
  101f93:	07                   	pop    %es
  101f94:	1f                   	pop    %ds
  101f95:	61                   	popa   
  101f96:	fb                   	sti    
  101f97:	cf                   	iret   

00101f98 <int_handler36>:
  101f98:	fa                   	cli    
  101f99:	60                   	pusha  
  101f9a:	1e                   	push   %ds
  101f9b:	06                   	push   %es
  101f9c:	0f a0                	push   %fs
  101f9e:	0f a8                	push   %gs
  101fa0:	53                   	push   %ebx
  101fa1:	66 bb 10 00          	mov    $0x10,%bx
  101fa5:	8e db                	mov    %ebx,%ds
  101fa7:	5b                   	pop    %ebx
  101fa8:	6a 00                	push   $0x0
  101faa:	6a 24                	push   $0x24
  101fac:	e8 1f e8 ff ff       	call   1007d0 <interrupt_handler>
  101fb1:	83 c4 08             	add    $0x8,%esp
  101fb4:	0f a9                	pop    %gs
  101fb6:	0f a1                	pop    %fs
  101fb8:	07                   	pop    %es
  101fb9:	1f                   	pop    %ds
  101fba:	61                   	popa   
  101fbb:	fb                   	sti    
  101fbc:	cf                   	iret   

00101fbd <int_handler37>:
  101fbd:	fa                   	cli    
  101fbe:	60                   	pusha  
  101fbf:	1e                   	push   %ds
  101fc0:	06                   	push   %es
  101fc1:	0f a0                	push   %fs
  101fc3:	0f a8                	push   %gs
  101fc5:	53                   	push   %ebx
  101fc6:	66 bb 10 00          	mov    $0x10,%bx
  101fca:	8e db                	mov    %ebx,%ds
  101fcc:	5b                   	pop    %ebx
  101fcd:	6a 00                	push   $0x0
  101fcf:	6a 25                	push   $0x25
  101fd1:	e8 fa e7 ff ff       	call   1007d0 <interrupt_handler>
  101fd6:	83 c4 08             	add    $0x8,%esp
  101fd9:	0f a9                	pop    %gs
  101fdb:	0f a1                	pop    %fs
  101fdd:	07                   	pop    %es
  101fde:	1f                   	pop    %ds
  101fdf:	61                   	popa   
  101fe0:	fb                   	sti    
  101fe1:	cf                   	iret   

00101fe2 <int_handler38>:
  101fe2:	fa                   	cli    
  101fe3:	60                   	pusha  
  101fe4:	1e                   	push   %ds
  101fe5:	06                   	push   %es
  101fe6:	0f a0                	push   %fs
  101fe8:	0f a8                	push   %gs
  101fea:	53                   	push   %ebx
  101feb:	66 bb 10 00          	mov    $0x10,%bx
  101fef:	8e db                	mov    %ebx,%ds
  101ff1:	5b                   	pop    %ebx
  101ff2:	6a 00                	push   $0x0
  101ff4:	6a 26                	push   $0x26
  101ff6:	e8 d5 e7 ff ff       	call   1007d0 <interrupt_handler>
  101ffb:	83 c4 08             	add    $0x8,%esp
  101ffe:	0f a9                	pop    %gs
  102000:	0f a1                	pop    %fs
  102002:	07                   	pop    %es
  102003:	1f                   	pop    %ds
  102004:	61                   	popa   
  102005:	fb                   	sti    
  102006:	cf                   	iret   

00102007 <int_handler39>:
  102007:	fa                   	cli    
  102008:	60                   	pusha  
  102009:	1e                   	push   %ds
  10200a:	06                   	push   %es
  10200b:	0f a0                	push   %fs
  10200d:	0f a8                	push   %gs
  10200f:	53                   	push   %ebx
  102010:	66 bb 10 00          	mov    $0x10,%bx
  102014:	8e db                	mov    %ebx,%ds
  102016:	5b                   	pop    %ebx
  102017:	6a 00                	push   $0x0
  102019:	6a 27                	push   $0x27
  10201b:	e8 b0 e7 ff ff       	call   1007d0 <interrupt_handler>
  102020:	83 c4 08             	add    $0x8,%esp
  102023:	0f a9                	pop    %gs
  102025:	0f a1                	pop    %fs
  102027:	07                   	pop    %es
  102028:	1f                   	pop    %ds
  102029:	61                   	popa   
  10202a:	fb                   	sti    
  10202b:	cf                   	iret   

0010202c <int_handler40>:
  10202c:	fa                   	cli    
  10202d:	60                   	pusha  
  10202e:	1e                   	push   %ds
  10202f:	06                   	push   %es
  102030:	0f a0                	push   %fs
  102032:	0f a8                	push   %gs
  102034:	53                   	push   %ebx
  102035:	66 bb 10 00          	mov    $0x10,%bx
  102039:	8e db                	mov    %ebx,%ds
  10203b:	5b                   	pop    %ebx
  10203c:	6a 00                	push   $0x0
  10203e:	6a 28                	push   $0x28
  102040:	e8 8b e7 ff ff       	call   1007d0 <interrupt_handler>
  102045:	83 c4 08             	add    $0x8,%esp
  102048:	0f a9                	pop    %gs
  10204a:	0f a1                	pop    %fs
  10204c:	07                   	pop    %es
  10204d:	1f                   	pop    %ds
  10204e:	61                   	popa   
  10204f:	fb                   	sti    
  102050:	cf                   	iret   

00102051 <int_handler41>:
  102051:	fa                   	cli    
  102052:	60                   	pusha  
  102053:	1e                   	push   %ds
  102054:	06                   	push   %es
  102055:	0f a0                	push   %fs
  102057:	0f a8                	push   %gs
  102059:	53                   	push   %ebx
  10205a:	66 bb 10 00          	mov    $0x10,%bx
  10205e:	8e db                	mov    %ebx,%ds
  102060:	5b                   	pop    %ebx
  102061:	6a 00                	push   $0x0
  102063:	6a 29                	push   $0x29
  102065:	e8 66 e7 ff ff       	call   1007d0 <interrupt_handler>
  10206a:	83 c4 08             	add    $0x8,%esp
  10206d:	0f a9                	pop    %gs
  10206f:	0f a1                	pop    %fs
  102071:	07                   	pop    %es
  102072:	1f                   	pop    %ds
  102073:	61                   	popa   
  102074:	fb                   	sti    
  102075:	cf                   	iret   

00102076 <int_handler42>:
  102076:	fa                   	cli    
  102077:	60                   	pusha  
  102078:	1e                   	push   %ds
  102079:	06                   	push   %es
  10207a:	0f a0                	push   %fs
  10207c:	0f a8                	push   %gs
  10207e:	53                   	push   %ebx
  10207f:	66 bb 10 00          	mov    $0x10,%bx
  102083:	8e db                	mov    %ebx,%ds
  102085:	5b                   	pop    %ebx
  102086:	6a 00                	push   $0x0
  102088:	6a 2a                	push   $0x2a
  10208a:	e8 41 e7 ff ff       	call   1007d0 <interrupt_handler>
  10208f:	83 c4 08             	add    $0x8,%esp
  102092:	0f a9                	pop    %gs
  102094:	0f a1                	pop    %fs
  102096:	07                   	pop    %es
  102097:	1f                   	pop    %ds
  102098:	61                   	popa   
  102099:	fb                   	sti    
  10209a:	cf                   	iret   

0010209b <int_handler43>:
  10209b:	fa                   	cli    
  10209c:	60                   	pusha  
  10209d:	1e                   	push   %ds
  10209e:	06                   	push   %es
  10209f:	0f a0                	push   %fs
  1020a1:	0f a8                	push   %gs
  1020a3:	53                   	push   %ebx
  1020a4:	66 bb 10 00          	mov    $0x10,%bx
  1020a8:	8e db                	mov    %ebx,%ds
  1020aa:	5b                   	pop    %ebx
  1020ab:	6a 00                	push   $0x0
  1020ad:	6a 2b                	push   $0x2b
  1020af:	e8 1c e7 ff ff       	call   1007d0 <interrupt_handler>
  1020b4:	83 c4 08             	add    $0x8,%esp
  1020b7:	0f a9                	pop    %gs
  1020b9:	0f a1                	pop    %fs
  1020bb:	07                   	pop    %es
  1020bc:	1f                   	pop    %ds
  1020bd:	61                   	popa   
  1020be:	fb                   	sti    
  1020bf:	cf                   	iret   

001020c0 <int_handler44>:
  1020c0:	fa                   	cli    
  1020c1:	60                   	pusha  
  1020c2:	1e                   	push   %ds
  1020c3:	06                   	push   %es
  1020c4:	0f a0                	push   %fs
  1020c6:	0f a8                	push   %gs
  1020c8:	53                   	push   %ebx
  1020c9:	66 bb 10 00          	mov    $0x10,%bx
  1020cd:	8e db                	mov    %ebx,%ds
  1020cf:	5b                   	pop    %ebx
  1020d0:	6a 00                	push   $0x0
  1020d2:	6a 2c                	push   $0x2c
  1020d4:	e8 f7 e6 ff ff       	call   1007d0 <interrupt_handler>
  1020d9:	83 c4 08             	add    $0x8,%esp
  1020dc:	0f a9                	pop    %gs
  1020de:	0f a1                	pop    %fs
  1020e0:	07                   	pop    %es
  1020e1:	1f                   	pop    %ds
  1020e2:	61                   	popa   
  1020e3:	fb                   	sti    
  1020e4:	cf                   	iret   

001020e5 <int_handler45>:
  1020e5:	fa                   	cli    
  1020e6:	60                   	pusha  
  1020e7:	1e                   	push   %ds
  1020e8:	06                   	push   %es
  1020e9:	0f a0                	push   %fs
  1020eb:	0f a8                	push   %gs
  1020ed:	53                   	push   %ebx
  1020ee:	66 bb 10 00          	mov    $0x10,%bx
  1020f2:	8e db                	mov    %ebx,%ds
  1020f4:	5b                   	pop    %ebx
  1020f5:	6a 00                	push   $0x0
  1020f7:	6a 2d                	push   $0x2d
  1020f9:	e8 d2 e6 ff ff       	call   1007d0 <interrupt_handler>
  1020fe:	83 c4 08             	add    $0x8,%esp
  102101:	0f a9                	pop    %gs
  102103:	0f a1                	pop    %fs
  102105:	07                   	pop    %es
  102106:	1f                   	pop    %ds
  102107:	61                   	popa   
  102108:	fb                   	sti    
  102109:	cf                   	iret   

0010210a <int_handler46>:
  10210a:	fa                   	cli    
  10210b:	60                   	pusha  
  10210c:	1e                   	push   %ds
  10210d:	06                   	push   %es
  10210e:	0f a0                	push   %fs
  102110:	0f a8                	push   %gs
  102112:	53                   	push   %ebx
  102113:	66 bb 10 00          	mov    $0x10,%bx
  102117:	8e db                	mov    %ebx,%ds
  102119:	5b                   	pop    %ebx
  10211a:	6a 00                	push   $0x0
  10211c:	6a 2e                	push   $0x2e
  10211e:	e8 ad e6 ff ff       	call   1007d0 <interrupt_handler>
  102123:	83 c4 08             	add    $0x8,%esp
  102126:	0f a9                	pop    %gs
  102128:	0f a1                	pop    %fs
  10212a:	07                   	pop    %es
  10212b:	1f                   	pop    %ds
  10212c:	61                   	popa   
  10212d:	fb                   	sti    
  10212e:	cf                   	iret   

0010212f <int_handler47>:
  10212f:	fa                   	cli    
  102130:	60                   	pusha  
  102131:	1e                   	push   %ds
  102132:	06                   	push   %es
  102133:	0f a0                	push   %fs
  102135:	0f a8                	push   %gs
  102137:	53                   	push   %ebx
  102138:	66 bb 10 00          	mov    $0x10,%bx
  10213c:	8e db                	mov    %ebx,%ds
  10213e:	5b                   	pop    %ebx
  10213f:	6a 00                	push   $0x0
  102141:	6a 2f                	push   $0x2f
  102143:	e8 88 e6 ff ff       	call   1007d0 <interrupt_handler>
  102148:	83 c4 08             	add    $0x8,%esp
  10214b:	0f a9                	pop    %gs
  10214d:	0f a1                	pop    %fs
  10214f:	07                   	pop    %es
  102150:	1f                   	pop    %ds
  102151:	61                   	popa   
  102152:	fb                   	sti    
  102153:	cf                   	iret   

00102154 <int_handler48>:
  102154:	fa                   	cli    
  102155:	60                   	pusha  
  102156:	1e                   	push   %ds
  102157:	06                   	push   %es
  102158:	0f a0                	push   %fs
  10215a:	0f a8                	push   %gs
  10215c:	53                   	push   %ebx
  10215d:	66 bb 10 00          	mov    $0x10,%bx
  102161:	8e db                	mov    %ebx,%ds
  102163:	5b                   	pop    %ebx
  102164:	6a 00                	push   $0x0
  102166:	6a 30                	push   $0x30
  102168:	e8 63 e6 ff ff       	call   1007d0 <interrupt_handler>
  10216d:	83 c4 08             	add    $0x8,%esp
  102170:	0f a9                	pop    %gs
  102172:	0f a1                	pop    %fs
  102174:	07                   	pop    %es
  102175:	1f                   	pop    %ds
  102176:	61                   	popa   
  102177:	fb                   	sti    
  102178:	cf                   	iret   

00102179 <int_handler49>:
  102179:	fa                   	cli    
  10217a:	60                   	pusha  
  10217b:	1e                   	push   %ds
  10217c:	06                   	push   %es
  10217d:	0f a0                	push   %fs
  10217f:	0f a8                	push   %gs
  102181:	53                   	push   %ebx
  102182:	66 bb 10 00          	mov    $0x10,%bx
  102186:	8e db                	mov    %ebx,%ds
  102188:	5b                   	pop    %ebx
  102189:	6a 00                	push   $0x0
  10218b:	6a 31                	push   $0x31
  10218d:	e8 3e e6 ff ff       	call   1007d0 <interrupt_handler>
  102192:	83 c4 08             	add    $0x8,%esp
  102195:	0f a9                	pop    %gs
  102197:	0f a1                	pop    %fs
  102199:	07                   	pop    %es
  10219a:	1f                   	pop    %ds
  10219b:	61                   	popa   
  10219c:	fb                   	sti    
  10219d:	cf                   	iret   

0010219e <int_handler50>:
  10219e:	fa                   	cli    
  10219f:	60                   	pusha  
  1021a0:	1e                   	push   %ds
  1021a1:	06                   	push   %es
  1021a2:	0f a0                	push   %fs
  1021a4:	0f a8                	push   %gs
  1021a6:	53                   	push   %ebx
  1021a7:	66 bb 10 00          	mov    $0x10,%bx
  1021ab:	8e db                	mov    %ebx,%ds
  1021ad:	5b                   	pop    %ebx
  1021ae:	6a 00                	push   $0x0
  1021b0:	6a 32                	push   $0x32
  1021b2:	e8 19 e6 ff ff       	call   1007d0 <interrupt_handler>
  1021b7:	83 c4 08             	add    $0x8,%esp
  1021ba:	0f a9                	pop    %gs
  1021bc:	0f a1                	pop    %fs
  1021be:	07                   	pop    %es
  1021bf:	1f                   	pop    %ds
  1021c0:	61                   	popa   
  1021c1:	fb                   	sti    
  1021c2:	cf                   	iret   

001021c3 <int_handler51>:
  1021c3:	fa                   	cli    
  1021c4:	60                   	pusha  
  1021c5:	1e                   	push   %ds
  1021c6:	06                   	push   %es
  1021c7:	0f a0                	push   %fs
  1021c9:	0f a8                	push   %gs
  1021cb:	53                   	push   %ebx
  1021cc:	66 bb 10 00          	mov    $0x10,%bx
  1021d0:	8e db                	mov    %ebx,%ds
  1021d2:	5b                   	pop    %ebx
  1021d3:	6a 00                	push   $0x0
  1021d5:	6a 33                	push   $0x33
  1021d7:	e8 f4 e5 ff ff       	call   1007d0 <interrupt_handler>
  1021dc:	83 c4 08             	add    $0x8,%esp
  1021df:	0f a9                	pop    %gs
  1021e1:	0f a1                	pop    %fs
  1021e3:	07                   	pop    %es
  1021e4:	1f                   	pop    %ds
  1021e5:	61                   	popa   
  1021e6:	fb                   	sti    
  1021e7:	cf                   	iret   

001021e8 <int_handler52>:
  1021e8:	fa                   	cli    
  1021e9:	60                   	pusha  
  1021ea:	1e                   	push   %ds
  1021eb:	06                   	push   %es
  1021ec:	0f a0                	push   %fs
  1021ee:	0f a8                	push   %gs
  1021f0:	53                   	push   %ebx
  1021f1:	66 bb 10 00          	mov    $0x10,%bx
  1021f5:	8e db                	mov    %ebx,%ds
  1021f7:	5b                   	pop    %ebx
  1021f8:	6a 00                	push   $0x0
  1021fa:	6a 34                	push   $0x34
  1021fc:	e8 cf e5 ff ff       	call   1007d0 <interrupt_handler>
  102201:	83 c4 08             	add    $0x8,%esp
  102204:	0f a9                	pop    %gs
  102206:	0f a1                	pop    %fs
  102208:	07                   	pop    %es
  102209:	1f                   	pop    %ds
  10220a:	61                   	popa   
  10220b:	fb                   	sti    
  10220c:	cf                   	iret   

0010220d <int_handler53>:
  10220d:	fa                   	cli    
  10220e:	60                   	pusha  
  10220f:	1e                   	push   %ds
  102210:	06                   	push   %es
  102211:	0f a0                	push   %fs
  102213:	0f a8                	push   %gs
  102215:	53                   	push   %ebx
  102216:	66 bb 10 00          	mov    $0x10,%bx
  10221a:	8e db                	mov    %ebx,%ds
  10221c:	5b                   	pop    %ebx
  10221d:	6a 00                	push   $0x0
  10221f:	6a 35                	push   $0x35
  102221:	e8 aa e5 ff ff       	call   1007d0 <interrupt_handler>
  102226:	83 c4 08             	add    $0x8,%esp
  102229:	0f a9                	pop    %gs
  10222b:	0f a1                	pop    %fs
  10222d:	07                   	pop    %es
  10222e:	1f                   	pop    %ds
  10222f:	61                   	popa   
  102230:	fb                   	sti    
  102231:	cf                   	iret   

00102232 <int_handler54>:
  102232:	fa                   	cli    
  102233:	60                   	pusha  
  102234:	1e                   	push   %ds
  102235:	06                   	push   %es
  102236:	0f a0                	push   %fs
  102238:	0f a8                	push   %gs
  10223a:	53                   	push   %ebx
  10223b:	66 bb 10 00          	mov    $0x10,%bx
  10223f:	8e db                	mov    %ebx,%ds
  102241:	5b                   	pop    %ebx
  102242:	6a 00                	push   $0x0
  102244:	6a 36                	push   $0x36
  102246:	e8 85 e5 ff ff       	call   1007d0 <interrupt_handler>
  10224b:	83 c4 08             	add    $0x8,%esp
  10224e:	0f a9                	pop    %gs
  102250:	0f a1                	pop    %fs
  102252:	07                   	pop    %es
  102253:	1f                   	pop    %ds
  102254:	61                   	popa   
  102255:	fb                   	sti    
  102256:	cf                   	iret   

00102257 <int_handler55>:
  102257:	fa                   	cli    
  102258:	60                   	pusha  
  102259:	1e                   	push   %ds
  10225a:	06                   	push   %es
  10225b:	0f a0                	push   %fs
  10225d:	0f a8                	push   %gs
  10225f:	53                   	push   %ebx
  102260:	66 bb 10 00          	mov    $0x10,%bx
  102264:	8e db                	mov    %ebx,%ds
  102266:	5b                   	pop    %ebx
  102267:	6a 00                	push   $0x0
  102269:	6a 37                	push   $0x37
  10226b:	e8 60 e5 ff ff       	call   1007d0 <interrupt_handler>
  102270:	83 c4 08             	add    $0x8,%esp
  102273:	0f a9                	pop    %gs
  102275:	0f a1                	pop    %fs
  102277:	07                   	pop    %es
  102278:	1f                   	pop    %ds
  102279:	61                   	popa   
  10227a:	fb                   	sti    
  10227b:	cf                   	iret   

0010227c <int_handler56>:
  10227c:	fa                   	cli    
  10227d:	60                   	pusha  
  10227e:	1e                   	push   %ds
  10227f:	06                   	push   %es
  102280:	0f a0                	push   %fs
  102282:	0f a8                	push   %gs
  102284:	53                   	push   %ebx
  102285:	66 bb 10 00          	mov    $0x10,%bx
  102289:	8e db                	mov    %ebx,%ds
  10228b:	5b                   	pop    %ebx
  10228c:	6a 00                	push   $0x0
  10228e:	6a 38                	push   $0x38
  102290:	e8 3b e5 ff ff       	call   1007d0 <interrupt_handler>
  102295:	83 c4 08             	add    $0x8,%esp
  102298:	0f a9                	pop    %gs
  10229a:	0f a1                	pop    %fs
  10229c:	07                   	pop    %es
  10229d:	1f                   	pop    %ds
  10229e:	61                   	popa   
  10229f:	fb                   	sti    
  1022a0:	cf                   	iret   

001022a1 <int_handler57>:
  1022a1:	fa                   	cli    
  1022a2:	60                   	pusha  
  1022a3:	1e                   	push   %ds
  1022a4:	06                   	push   %es
  1022a5:	0f a0                	push   %fs
  1022a7:	0f a8                	push   %gs
  1022a9:	53                   	push   %ebx
  1022aa:	66 bb 10 00          	mov    $0x10,%bx
  1022ae:	8e db                	mov    %ebx,%ds
  1022b0:	5b                   	pop    %ebx
  1022b1:	6a 00                	push   $0x0
  1022b3:	6a 39                	push   $0x39
  1022b5:	e8 16 e5 ff ff       	call   1007d0 <interrupt_handler>
  1022ba:	83 c4 08             	add    $0x8,%esp
  1022bd:	0f a9                	pop    %gs
  1022bf:	0f a1                	pop    %fs
  1022c1:	07                   	pop    %es
  1022c2:	1f                   	pop    %ds
  1022c3:	61                   	popa   
  1022c4:	fb                   	sti    
  1022c5:	cf                   	iret   

001022c6 <int_handler58>:
  1022c6:	fa                   	cli    
  1022c7:	60                   	pusha  
  1022c8:	1e                   	push   %ds
  1022c9:	06                   	push   %es
  1022ca:	0f a0                	push   %fs
  1022cc:	0f a8                	push   %gs
  1022ce:	53                   	push   %ebx
  1022cf:	66 bb 10 00          	mov    $0x10,%bx
  1022d3:	8e db                	mov    %ebx,%ds
  1022d5:	5b                   	pop    %ebx
  1022d6:	6a 00                	push   $0x0
  1022d8:	6a 3a                	push   $0x3a
  1022da:	e8 f1 e4 ff ff       	call   1007d0 <interrupt_handler>
  1022df:	83 c4 08             	add    $0x8,%esp
  1022e2:	0f a9                	pop    %gs
  1022e4:	0f a1                	pop    %fs
  1022e6:	07                   	pop    %es
  1022e7:	1f                   	pop    %ds
  1022e8:	61                   	popa   
  1022e9:	fb                   	sti    
  1022ea:	cf                   	iret   

001022eb <int_handler59>:
  1022eb:	fa                   	cli    
  1022ec:	60                   	pusha  
  1022ed:	1e                   	push   %ds
  1022ee:	06                   	push   %es
  1022ef:	0f a0                	push   %fs
  1022f1:	0f a8                	push   %gs
  1022f3:	53                   	push   %ebx
  1022f4:	66 bb 10 00          	mov    $0x10,%bx
  1022f8:	8e db                	mov    %ebx,%ds
  1022fa:	5b                   	pop    %ebx
  1022fb:	6a 00                	push   $0x0
  1022fd:	6a 3b                	push   $0x3b
  1022ff:	e8 cc e4 ff ff       	call   1007d0 <interrupt_handler>
  102304:	83 c4 08             	add    $0x8,%esp
  102307:	0f a9                	pop    %gs
  102309:	0f a1                	pop    %fs
  10230b:	07                   	pop    %es
  10230c:	1f                   	pop    %ds
  10230d:	61                   	popa   
  10230e:	fb                   	sti    
  10230f:	cf                   	iret   

00102310 <int_handler60>:
  102310:	fa                   	cli    
  102311:	60                   	pusha  
  102312:	1e                   	push   %ds
  102313:	06                   	push   %es
  102314:	0f a0                	push   %fs
  102316:	0f a8                	push   %gs
  102318:	53                   	push   %ebx
  102319:	66 bb 10 00          	mov    $0x10,%bx
  10231d:	8e db                	mov    %ebx,%ds
  10231f:	5b                   	pop    %ebx
  102320:	6a 00                	push   $0x0
  102322:	6a 3c                	push   $0x3c
  102324:	e8 a7 e4 ff ff       	call   1007d0 <interrupt_handler>
  102329:	83 c4 08             	add    $0x8,%esp
  10232c:	0f a9                	pop    %gs
  10232e:	0f a1                	pop    %fs
  102330:	07                   	pop    %es
  102331:	1f                   	pop    %ds
  102332:	61                   	popa   
  102333:	fb                   	sti    
  102334:	cf                   	iret   

00102335 <int_handler61>:
  102335:	fa                   	cli    
  102336:	60                   	pusha  
  102337:	1e                   	push   %ds
  102338:	06                   	push   %es
  102339:	0f a0                	push   %fs
  10233b:	0f a8                	push   %gs
  10233d:	53                   	push   %ebx
  10233e:	66 bb 10 00          	mov    $0x10,%bx
  102342:	8e db                	mov    %ebx,%ds
  102344:	5b                   	pop    %ebx
  102345:	6a 00                	push   $0x0
  102347:	6a 3d                	push   $0x3d
  102349:	e8 82 e4 ff ff       	call   1007d0 <interrupt_handler>
  10234e:	83 c4 08             	add    $0x8,%esp
  102351:	0f a9                	pop    %gs
  102353:	0f a1                	pop    %fs
  102355:	07                   	pop    %es
  102356:	1f                   	pop    %ds
  102357:	61                   	popa   
  102358:	fb                   	sti    
  102359:	cf                   	iret   

0010235a <int_handler62>:
  10235a:	fa                   	cli    
  10235b:	60                   	pusha  
  10235c:	1e                   	push   %ds
  10235d:	06                   	push   %es
  10235e:	0f a0                	push   %fs
  102360:	0f a8                	push   %gs
  102362:	53                   	push   %ebx
  102363:	66 bb 10 00          	mov    $0x10,%bx
  102367:	8e db                	mov    %ebx,%ds
  102369:	5b                   	pop    %ebx
  10236a:	6a 00                	push   $0x0
  10236c:	6a 3e                	push   $0x3e
  10236e:	e8 5d e4 ff ff       	call   1007d0 <interrupt_handler>
  102373:	83 c4 08             	add    $0x8,%esp
  102376:	0f a9                	pop    %gs
  102378:	0f a1                	pop    %fs
  10237a:	07                   	pop    %es
  10237b:	1f                   	pop    %ds
  10237c:	61                   	popa   
  10237d:	fb                   	sti    
  10237e:	cf                   	iret   

0010237f <int_handler63>:
  10237f:	fa                   	cli    
  102380:	60                   	pusha  
  102381:	1e                   	push   %ds
  102382:	06                   	push   %es
  102383:	0f a0                	push   %fs
  102385:	0f a8                	push   %gs
  102387:	53                   	push   %ebx
  102388:	66 bb 10 00          	mov    $0x10,%bx
  10238c:	8e db                	mov    %ebx,%ds
  10238e:	5b                   	pop    %ebx
  10238f:	6a 00                	push   $0x0
  102391:	6a 3f                	push   $0x3f
  102393:	e8 38 e4 ff ff       	call   1007d0 <interrupt_handler>
  102398:	83 c4 08             	add    $0x8,%esp
  10239b:	0f a9                	pop    %gs
  10239d:	0f a1                	pop    %fs
  10239f:	07                   	pop    %es
  1023a0:	1f                   	pop    %ds
  1023a1:	61                   	popa   
  1023a2:	fb                   	sti    
  1023a3:	cf                   	iret   

001023a4 <int_handler64>:
  1023a4:	fa                   	cli    
  1023a5:	60                   	pusha  
  1023a6:	1e                   	push   %ds
  1023a7:	06                   	push   %es
  1023a8:	0f a0                	push   %fs
  1023aa:	0f a8                	push   %gs
  1023ac:	53                   	push   %ebx
  1023ad:	66 bb 10 00          	mov    $0x10,%bx
  1023b1:	8e db                	mov    %ebx,%ds
  1023b3:	5b                   	pop    %ebx
  1023b4:	6a 00                	push   $0x0
  1023b6:	6a 40                	push   $0x40
  1023b8:	e8 13 e4 ff ff       	call   1007d0 <interrupt_handler>
  1023bd:	83 c4 08             	add    $0x8,%esp
  1023c0:	0f a9                	pop    %gs
  1023c2:	0f a1                	pop    %fs
  1023c4:	07                   	pop    %es
  1023c5:	1f                   	pop    %ds
  1023c6:	61                   	popa   
  1023c7:	fb                   	sti    
  1023c8:	cf                   	iret   

001023c9 <int_handler65>:
  1023c9:	fa                   	cli    
  1023ca:	60                   	pusha  
  1023cb:	1e                   	push   %ds
  1023cc:	06                   	push   %es
  1023cd:	0f a0                	push   %fs
  1023cf:	0f a8                	push   %gs
  1023d1:	53                   	push   %ebx
  1023d2:	66 bb 10 00          	mov    $0x10,%bx
  1023d6:	8e db                	mov    %ebx,%ds
  1023d8:	5b                   	pop    %ebx
  1023d9:	6a 00                	push   $0x0
  1023db:	6a 41                	push   $0x41
  1023dd:	e8 ee e3 ff ff       	call   1007d0 <interrupt_handler>
  1023e2:	83 c4 08             	add    $0x8,%esp
  1023e5:	0f a9                	pop    %gs
  1023e7:	0f a1                	pop    %fs
  1023e9:	07                   	pop    %es
  1023ea:	1f                   	pop    %ds
  1023eb:	61                   	popa   
  1023ec:	fb                   	sti    
  1023ed:	cf                   	iret   

001023ee <int_handler66>:
  1023ee:	fa                   	cli    
  1023ef:	60                   	pusha  
  1023f0:	1e                   	push   %ds
  1023f1:	06                   	push   %es
  1023f2:	0f a0                	push   %fs
  1023f4:	0f a8                	push   %gs
  1023f6:	53                   	push   %ebx
  1023f7:	66 bb 10 00          	mov    $0x10,%bx
  1023fb:	8e db                	mov    %ebx,%ds
  1023fd:	5b                   	pop    %ebx
  1023fe:	6a 00                	push   $0x0
  102400:	6a 42                	push   $0x42
  102402:	e8 c9 e3 ff ff       	call   1007d0 <interrupt_handler>
  102407:	83 c4 08             	add    $0x8,%esp
  10240a:	0f a9                	pop    %gs
  10240c:	0f a1                	pop    %fs
  10240e:	07                   	pop    %es
  10240f:	1f                   	pop    %ds
  102410:	61                   	popa   
  102411:	fb                   	sti    
  102412:	cf                   	iret   

00102413 <int_handler67>:
  102413:	fa                   	cli    
  102414:	60                   	pusha  
  102415:	1e                   	push   %ds
  102416:	06                   	push   %es
  102417:	0f a0                	push   %fs
  102419:	0f a8                	push   %gs
  10241b:	53                   	push   %ebx
  10241c:	66 bb 10 00          	mov    $0x10,%bx
  102420:	8e db                	mov    %ebx,%ds
  102422:	5b                   	pop    %ebx
  102423:	6a 00                	push   $0x0
  102425:	6a 43                	push   $0x43
  102427:	e8 a4 e3 ff ff       	call   1007d0 <interrupt_handler>
  10242c:	83 c4 08             	add    $0x8,%esp
  10242f:	0f a9                	pop    %gs
  102431:	0f a1                	pop    %fs
  102433:	07                   	pop    %es
  102434:	1f                   	pop    %ds
  102435:	61                   	popa   
  102436:	fb                   	sti    
  102437:	cf                   	iret   

00102438 <int_handler68>:
  102438:	fa                   	cli    
  102439:	60                   	pusha  
  10243a:	1e                   	push   %ds
  10243b:	06                   	push   %es
  10243c:	0f a0                	push   %fs
  10243e:	0f a8                	push   %gs
  102440:	53                   	push   %ebx
  102441:	66 bb 10 00          	mov    $0x10,%bx
  102445:	8e db                	mov    %ebx,%ds
  102447:	5b                   	pop    %ebx
  102448:	6a 00                	push   $0x0
  10244a:	6a 44                	push   $0x44
  10244c:	e8 7f e3 ff ff       	call   1007d0 <interrupt_handler>
  102451:	83 c4 08             	add    $0x8,%esp
  102454:	0f a9                	pop    %gs
  102456:	0f a1                	pop    %fs
  102458:	07                   	pop    %es
  102459:	1f                   	pop    %ds
  10245a:	61                   	popa   
  10245b:	fb                   	sti    
  10245c:	cf                   	iret   

0010245d <int_handler69>:
  10245d:	fa                   	cli    
  10245e:	60                   	pusha  
  10245f:	1e                   	push   %ds
  102460:	06                   	push   %es
  102461:	0f a0                	push   %fs
  102463:	0f a8                	push   %gs
  102465:	53                   	push   %ebx
  102466:	66 bb 10 00          	mov    $0x10,%bx
  10246a:	8e db                	mov    %ebx,%ds
  10246c:	5b                   	pop    %ebx
  10246d:	6a 00                	push   $0x0
  10246f:	6a 45                	push   $0x45
  102471:	e8 5a e3 ff ff       	call   1007d0 <interrupt_handler>
  102476:	83 c4 08             	add    $0x8,%esp
  102479:	0f a9                	pop    %gs
  10247b:	0f a1                	pop    %fs
  10247d:	07                   	pop    %es
  10247e:	1f                   	pop    %ds
  10247f:	61                   	popa   
  102480:	fb                   	sti    
  102481:	cf                   	iret   

00102482 <int_handler70>:
  102482:	fa                   	cli    
  102483:	60                   	pusha  
  102484:	1e                   	push   %ds
  102485:	06                   	push   %es
  102486:	0f a0                	push   %fs
  102488:	0f a8                	push   %gs
  10248a:	53                   	push   %ebx
  10248b:	66 bb 10 00          	mov    $0x10,%bx
  10248f:	8e db                	mov    %ebx,%ds
  102491:	5b                   	pop    %ebx
  102492:	6a 00                	push   $0x0
  102494:	6a 46                	push   $0x46
  102496:	e8 35 e3 ff ff       	call   1007d0 <interrupt_handler>
  10249b:	83 c4 08             	add    $0x8,%esp
  10249e:	0f a9                	pop    %gs
  1024a0:	0f a1                	pop    %fs
  1024a2:	07                   	pop    %es
  1024a3:	1f                   	pop    %ds
  1024a4:	61                   	popa   
  1024a5:	fb                   	sti    
  1024a6:	cf                   	iret   

001024a7 <int_handler71>:
  1024a7:	fa                   	cli    
  1024a8:	60                   	pusha  
  1024a9:	1e                   	push   %ds
  1024aa:	06                   	push   %es
  1024ab:	0f a0                	push   %fs
  1024ad:	0f a8                	push   %gs
  1024af:	53                   	push   %ebx
  1024b0:	66 bb 10 00          	mov    $0x10,%bx
  1024b4:	8e db                	mov    %ebx,%ds
  1024b6:	5b                   	pop    %ebx
  1024b7:	6a 00                	push   $0x0
  1024b9:	6a 47                	push   $0x47
  1024bb:	e8 10 e3 ff ff       	call   1007d0 <interrupt_handler>
  1024c0:	83 c4 08             	add    $0x8,%esp
  1024c3:	0f a9                	pop    %gs
  1024c5:	0f a1                	pop    %fs
  1024c7:	07                   	pop    %es
  1024c8:	1f                   	pop    %ds
  1024c9:	61                   	popa   
  1024ca:	fb                   	sti    
  1024cb:	cf                   	iret   

001024cc <int_handler72>:
  1024cc:	fa                   	cli    
  1024cd:	60                   	pusha  
  1024ce:	1e                   	push   %ds
  1024cf:	06                   	push   %es
  1024d0:	0f a0                	push   %fs
  1024d2:	0f a8                	push   %gs
  1024d4:	53                   	push   %ebx
  1024d5:	66 bb 10 00          	mov    $0x10,%bx
  1024d9:	8e db                	mov    %ebx,%ds
  1024db:	5b                   	pop    %ebx
  1024dc:	6a 00                	push   $0x0
  1024de:	6a 48                	push   $0x48
  1024e0:	e8 eb e2 ff ff       	call   1007d0 <interrupt_handler>
  1024e5:	83 c4 08             	add    $0x8,%esp
  1024e8:	0f a9                	pop    %gs
  1024ea:	0f a1                	pop    %fs
  1024ec:	07                   	pop    %es
  1024ed:	1f                   	pop    %ds
  1024ee:	61                   	popa   
  1024ef:	fb                   	sti    
  1024f0:	cf                   	iret   

001024f1 <int_handler73>:
  1024f1:	fa                   	cli    
  1024f2:	60                   	pusha  
  1024f3:	1e                   	push   %ds
  1024f4:	06                   	push   %es
  1024f5:	0f a0                	push   %fs
  1024f7:	0f a8                	push   %gs
  1024f9:	53                   	push   %ebx
  1024fa:	66 bb 10 00          	mov    $0x10,%bx
  1024fe:	8e db                	mov    %ebx,%ds
  102500:	5b                   	pop    %ebx
  102501:	6a 00                	push   $0x0
  102503:	6a 49                	push   $0x49
  102505:	e8 c6 e2 ff ff       	call   1007d0 <interrupt_handler>
  10250a:	83 c4 08             	add    $0x8,%esp
  10250d:	0f a9                	pop    %gs
  10250f:	0f a1                	pop    %fs
  102511:	07                   	pop    %es
  102512:	1f                   	pop    %ds
  102513:	61                   	popa   
  102514:	fb                   	sti    
  102515:	cf                   	iret   

00102516 <int_handler74>:
  102516:	fa                   	cli    
  102517:	60                   	pusha  
  102518:	1e                   	push   %ds
  102519:	06                   	push   %es
  10251a:	0f a0                	push   %fs
  10251c:	0f a8                	push   %gs
  10251e:	53                   	push   %ebx
  10251f:	66 bb 10 00          	mov    $0x10,%bx
  102523:	8e db                	mov    %ebx,%ds
  102525:	5b                   	pop    %ebx
  102526:	6a 00                	push   $0x0
  102528:	6a 4a                	push   $0x4a
  10252a:	e8 a1 e2 ff ff       	call   1007d0 <interrupt_handler>
  10252f:	83 c4 08             	add    $0x8,%esp
  102532:	0f a9                	pop    %gs
  102534:	0f a1                	pop    %fs
  102536:	07                   	pop    %es
  102537:	1f                   	pop    %ds
  102538:	61                   	popa   
  102539:	fb                   	sti    
  10253a:	cf                   	iret   

0010253b <int_handler75>:
  10253b:	fa                   	cli    
  10253c:	60                   	pusha  
  10253d:	1e                   	push   %ds
  10253e:	06                   	push   %es
  10253f:	0f a0                	push   %fs
  102541:	0f a8                	push   %gs
  102543:	53                   	push   %ebx
  102544:	66 bb 10 00          	mov    $0x10,%bx
  102548:	8e db                	mov    %ebx,%ds
  10254a:	5b                   	pop    %ebx
  10254b:	6a 00                	push   $0x0
  10254d:	6a 4b                	push   $0x4b
  10254f:	e8 7c e2 ff ff       	call   1007d0 <interrupt_handler>
  102554:	83 c4 08             	add    $0x8,%esp
  102557:	0f a9                	pop    %gs
  102559:	0f a1                	pop    %fs
  10255b:	07                   	pop    %es
  10255c:	1f                   	pop    %ds
  10255d:	61                   	popa   
  10255e:	fb                   	sti    
  10255f:	cf                   	iret   

00102560 <int_handler76>:
  102560:	fa                   	cli    
  102561:	60                   	pusha  
  102562:	1e                   	push   %ds
  102563:	06                   	push   %es
  102564:	0f a0                	push   %fs
  102566:	0f a8                	push   %gs
  102568:	53                   	push   %ebx
  102569:	66 bb 10 00          	mov    $0x10,%bx
  10256d:	8e db                	mov    %ebx,%ds
  10256f:	5b                   	pop    %ebx
  102570:	6a 00                	push   $0x0
  102572:	6a 4c                	push   $0x4c
  102574:	e8 57 e2 ff ff       	call   1007d0 <interrupt_handler>
  102579:	83 c4 08             	add    $0x8,%esp
  10257c:	0f a9                	pop    %gs
  10257e:	0f a1                	pop    %fs
  102580:	07                   	pop    %es
  102581:	1f                   	pop    %ds
  102582:	61                   	popa   
  102583:	fb                   	sti    
  102584:	cf                   	iret   

00102585 <int_handler77>:
  102585:	fa                   	cli    
  102586:	60                   	pusha  
  102587:	1e                   	push   %ds
  102588:	06                   	push   %es
  102589:	0f a0                	push   %fs
  10258b:	0f a8                	push   %gs
  10258d:	53                   	push   %ebx
  10258e:	66 bb 10 00          	mov    $0x10,%bx
  102592:	8e db                	mov    %ebx,%ds
  102594:	5b                   	pop    %ebx
  102595:	6a 00                	push   $0x0
  102597:	6a 4d                	push   $0x4d
  102599:	e8 32 e2 ff ff       	call   1007d0 <interrupt_handler>
  10259e:	83 c4 08             	add    $0x8,%esp
  1025a1:	0f a9                	pop    %gs
  1025a3:	0f a1                	pop    %fs
  1025a5:	07                   	pop    %es
  1025a6:	1f                   	pop    %ds
  1025a7:	61                   	popa   
  1025a8:	fb                   	sti    
  1025a9:	cf                   	iret   

001025aa <int_handler78>:
  1025aa:	fa                   	cli    
  1025ab:	60                   	pusha  
  1025ac:	1e                   	push   %ds
  1025ad:	06                   	push   %es
  1025ae:	0f a0                	push   %fs
  1025b0:	0f a8                	push   %gs
  1025b2:	53                   	push   %ebx
  1025b3:	66 bb 10 00          	mov    $0x10,%bx
  1025b7:	8e db                	mov    %ebx,%ds
  1025b9:	5b                   	pop    %ebx
  1025ba:	6a 00                	push   $0x0
  1025bc:	6a 4e                	push   $0x4e
  1025be:	e8 0d e2 ff ff       	call   1007d0 <interrupt_handler>
  1025c3:	83 c4 08             	add    $0x8,%esp
  1025c6:	0f a9                	pop    %gs
  1025c8:	0f a1                	pop    %fs
  1025ca:	07                   	pop    %es
  1025cb:	1f                   	pop    %ds
  1025cc:	61                   	popa   
  1025cd:	fb                   	sti    
  1025ce:	cf                   	iret   

001025cf <int_handler79>:
  1025cf:	fa                   	cli    
  1025d0:	60                   	pusha  
  1025d1:	1e                   	push   %ds
  1025d2:	06                   	push   %es
  1025d3:	0f a0                	push   %fs
  1025d5:	0f a8                	push   %gs
  1025d7:	53                   	push   %ebx
  1025d8:	66 bb 10 00          	mov    $0x10,%bx
  1025dc:	8e db                	mov    %ebx,%ds
  1025de:	5b                   	pop    %ebx
  1025df:	6a 00                	push   $0x0
  1025e1:	6a 4f                	push   $0x4f
  1025e3:	e8 e8 e1 ff ff       	call   1007d0 <interrupt_handler>
  1025e8:	83 c4 08             	add    $0x8,%esp
  1025eb:	0f a9                	pop    %gs
  1025ed:	0f a1                	pop    %fs
  1025ef:	07                   	pop    %es
  1025f0:	1f                   	pop    %ds
  1025f1:	61                   	popa   
  1025f2:	fb                   	sti    
  1025f3:	cf                   	iret   

001025f4 <int_handler80>:
  1025f4:	fa                   	cli    
  1025f5:	60                   	pusha  
  1025f6:	1e                   	push   %ds
  1025f7:	06                   	push   %es
  1025f8:	0f a0                	push   %fs
  1025fa:	0f a8                	push   %gs
  1025fc:	53                   	push   %ebx
  1025fd:	66 bb 10 00          	mov    $0x10,%bx
  102601:	8e db                	mov    %ebx,%ds
  102603:	5b                   	pop    %ebx
  102604:	6a 00                	push   $0x0
  102606:	6a 50                	push   $0x50
  102608:	e8 c3 e1 ff ff       	call   1007d0 <interrupt_handler>
  10260d:	83 c4 08             	add    $0x8,%esp
  102610:	0f a9                	pop    %gs
  102612:	0f a1                	pop    %fs
  102614:	07                   	pop    %es
  102615:	1f                   	pop    %ds
  102616:	61                   	popa   
  102617:	fb                   	sti    
  102618:	cf                   	iret   

00102619 <int_handler81>:
  102619:	fa                   	cli    
  10261a:	60                   	pusha  
  10261b:	1e                   	push   %ds
  10261c:	06                   	push   %es
  10261d:	0f a0                	push   %fs
  10261f:	0f a8                	push   %gs
  102621:	53                   	push   %ebx
  102622:	66 bb 10 00          	mov    $0x10,%bx
  102626:	8e db                	mov    %ebx,%ds
  102628:	5b                   	pop    %ebx
  102629:	6a 00                	push   $0x0
  10262b:	6a 51                	push   $0x51
  10262d:	e8 9e e1 ff ff       	call   1007d0 <interrupt_handler>
  102632:	83 c4 08             	add    $0x8,%esp
  102635:	0f a9                	pop    %gs
  102637:	0f a1                	pop    %fs
  102639:	07                   	pop    %es
  10263a:	1f                   	pop    %ds
  10263b:	61                   	popa   
  10263c:	fb                   	sti    
  10263d:	cf                   	iret   

0010263e <int_handler82>:
  10263e:	fa                   	cli    
  10263f:	60                   	pusha  
  102640:	1e                   	push   %ds
  102641:	06                   	push   %es
  102642:	0f a0                	push   %fs
  102644:	0f a8                	push   %gs
  102646:	53                   	push   %ebx
  102647:	66 bb 10 00          	mov    $0x10,%bx
  10264b:	8e db                	mov    %ebx,%ds
  10264d:	5b                   	pop    %ebx
  10264e:	6a 00                	push   $0x0
  102650:	6a 52                	push   $0x52
  102652:	e8 79 e1 ff ff       	call   1007d0 <interrupt_handler>
  102657:	83 c4 08             	add    $0x8,%esp
  10265a:	0f a9                	pop    %gs
  10265c:	0f a1                	pop    %fs
  10265e:	07                   	pop    %es
  10265f:	1f                   	pop    %ds
  102660:	61                   	popa   
  102661:	fb                   	sti    
  102662:	cf                   	iret   

00102663 <int_handler83>:
  102663:	fa                   	cli    
  102664:	60                   	pusha  
  102665:	1e                   	push   %ds
  102666:	06                   	push   %es
  102667:	0f a0                	push   %fs
  102669:	0f a8                	push   %gs
  10266b:	53                   	push   %ebx
  10266c:	66 bb 10 00          	mov    $0x10,%bx
  102670:	8e db                	mov    %ebx,%ds
  102672:	5b                   	pop    %ebx
  102673:	6a 00                	push   $0x0
  102675:	6a 53                	push   $0x53
  102677:	e8 54 e1 ff ff       	call   1007d0 <interrupt_handler>
  10267c:	83 c4 08             	add    $0x8,%esp
  10267f:	0f a9                	pop    %gs
  102681:	0f a1                	pop    %fs
  102683:	07                   	pop    %es
  102684:	1f                   	pop    %ds
  102685:	61                   	popa   
  102686:	fb                   	sti    
  102687:	cf                   	iret   

00102688 <int_handler84>:
  102688:	fa                   	cli    
  102689:	60                   	pusha  
  10268a:	1e                   	push   %ds
  10268b:	06                   	push   %es
  10268c:	0f a0                	push   %fs
  10268e:	0f a8                	push   %gs
  102690:	53                   	push   %ebx
  102691:	66 bb 10 00          	mov    $0x10,%bx
  102695:	8e db                	mov    %ebx,%ds
  102697:	5b                   	pop    %ebx
  102698:	6a 00                	push   $0x0
  10269a:	6a 54                	push   $0x54
  10269c:	e8 2f e1 ff ff       	call   1007d0 <interrupt_handler>
  1026a1:	83 c4 08             	add    $0x8,%esp
  1026a4:	0f a9                	pop    %gs
  1026a6:	0f a1                	pop    %fs
  1026a8:	07                   	pop    %es
  1026a9:	1f                   	pop    %ds
  1026aa:	61                   	popa   
  1026ab:	fb                   	sti    
  1026ac:	cf                   	iret   

001026ad <int_handler85>:
  1026ad:	fa                   	cli    
  1026ae:	60                   	pusha  
  1026af:	1e                   	push   %ds
  1026b0:	06                   	push   %es
  1026b1:	0f a0                	push   %fs
  1026b3:	0f a8                	push   %gs
  1026b5:	53                   	push   %ebx
  1026b6:	66 bb 10 00          	mov    $0x10,%bx
  1026ba:	8e db                	mov    %ebx,%ds
  1026bc:	5b                   	pop    %ebx
  1026bd:	6a 00                	push   $0x0
  1026bf:	6a 55                	push   $0x55
  1026c1:	e8 0a e1 ff ff       	call   1007d0 <interrupt_handler>
  1026c6:	83 c4 08             	add    $0x8,%esp
  1026c9:	0f a9                	pop    %gs
  1026cb:	0f a1                	pop    %fs
  1026cd:	07                   	pop    %es
  1026ce:	1f                   	pop    %ds
  1026cf:	61                   	popa   
  1026d0:	fb                   	sti    
  1026d1:	cf                   	iret   

001026d2 <int_handler86>:
  1026d2:	fa                   	cli    
  1026d3:	60                   	pusha  
  1026d4:	1e                   	push   %ds
  1026d5:	06                   	push   %es
  1026d6:	0f a0                	push   %fs
  1026d8:	0f a8                	push   %gs
  1026da:	53                   	push   %ebx
  1026db:	66 bb 10 00          	mov    $0x10,%bx
  1026df:	8e db                	mov    %ebx,%ds
  1026e1:	5b                   	pop    %ebx
  1026e2:	6a 00                	push   $0x0
  1026e4:	6a 56                	push   $0x56
  1026e6:	e8 e5 e0 ff ff       	call   1007d0 <interrupt_handler>
  1026eb:	83 c4 08             	add    $0x8,%esp
  1026ee:	0f a9                	pop    %gs
  1026f0:	0f a1                	pop    %fs
  1026f2:	07                   	pop    %es
  1026f3:	1f                   	pop    %ds
  1026f4:	61                   	popa   
  1026f5:	fb                   	sti    
  1026f6:	cf                   	iret   

001026f7 <int_handler87>:
  1026f7:	fa                   	cli    
  1026f8:	60                   	pusha  
  1026f9:	1e                   	push   %ds
  1026fa:	06                   	push   %es
  1026fb:	0f a0                	push   %fs
  1026fd:	0f a8                	push   %gs
  1026ff:	53                   	push   %ebx
  102700:	66 bb 10 00          	mov    $0x10,%bx
  102704:	8e db                	mov    %ebx,%ds
  102706:	5b                   	pop    %ebx
  102707:	6a 00                	push   $0x0
  102709:	6a 57                	push   $0x57
  10270b:	e8 c0 e0 ff ff       	call   1007d0 <interrupt_handler>
  102710:	83 c4 08             	add    $0x8,%esp
  102713:	0f a9                	pop    %gs
  102715:	0f a1                	pop    %fs
  102717:	07                   	pop    %es
  102718:	1f                   	pop    %ds
  102719:	61                   	popa   
  10271a:	fb                   	sti    
  10271b:	cf                   	iret   

0010271c <int_handler88>:
  10271c:	fa                   	cli    
  10271d:	60                   	pusha  
  10271e:	1e                   	push   %ds
  10271f:	06                   	push   %es
  102720:	0f a0                	push   %fs
  102722:	0f a8                	push   %gs
  102724:	53                   	push   %ebx
  102725:	66 bb 10 00          	mov    $0x10,%bx
  102729:	8e db                	mov    %ebx,%ds
  10272b:	5b                   	pop    %ebx
  10272c:	6a 00                	push   $0x0
  10272e:	6a 58                	push   $0x58
  102730:	e8 9b e0 ff ff       	call   1007d0 <interrupt_handler>
  102735:	83 c4 08             	add    $0x8,%esp
  102738:	0f a9                	pop    %gs
  10273a:	0f a1                	pop    %fs
  10273c:	07                   	pop    %es
  10273d:	1f                   	pop    %ds
  10273e:	61                   	popa   
  10273f:	fb                   	sti    
  102740:	cf                   	iret   

00102741 <int_handler89>:
  102741:	fa                   	cli    
  102742:	60                   	pusha  
  102743:	1e                   	push   %ds
  102744:	06                   	push   %es
  102745:	0f a0                	push   %fs
  102747:	0f a8                	push   %gs
  102749:	53                   	push   %ebx
  10274a:	66 bb 10 00          	mov    $0x10,%bx
  10274e:	8e db                	mov    %ebx,%ds
  102750:	5b                   	pop    %ebx
  102751:	6a 00                	push   $0x0
  102753:	6a 59                	push   $0x59
  102755:	e8 76 e0 ff ff       	call   1007d0 <interrupt_handler>
  10275a:	83 c4 08             	add    $0x8,%esp
  10275d:	0f a9                	pop    %gs
  10275f:	0f a1                	pop    %fs
  102761:	07                   	pop    %es
  102762:	1f                   	pop    %ds
  102763:	61                   	popa   
  102764:	fb                   	sti    
  102765:	cf                   	iret   

00102766 <int_handler90>:
  102766:	fa                   	cli    
  102767:	60                   	pusha  
  102768:	1e                   	push   %ds
  102769:	06                   	push   %es
  10276a:	0f a0                	push   %fs
  10276c:	0f a8                	push   %gs
  10276e:	53                   	push   %ebx
  10276f:	66 bb 10 00          	mov    $0x10,%bx
  102773:	8e db                	mov    %ebx,%ds
  102775:	5b                   	pop    %ebx
  102776:	6a 00                	push   $0x0
  102778:	6a 5a                	push   $0x5a
  10277a:	e8 51 e0 ff ff       	call   1007d0 <interrupt_handler>
  10277f:	83 c4 08             	add    $0x8,%esp
  102782:	0f a9                	pop    %gs
  102784:	0f a1                	pop    %fs
  102786:	07                   	pop    %es
  102787:	1f                   	pop    %ds
  102788:	61                   	popa   
  102789:	fb                   	sti    
  10278a:	cf                   	iret   

0010278b <int_handler91>:
  10278b:	fa                   	cli    
  10278c:	60                   	pusha  
  10278d:	1e                   	push   %ds
  10278e:	06                   	push   %es
  10278f:	0f a0                	push   %fs
  102791:	0f a8                	push   %gs
  102793:	53                   	push   %ebx
  102794:	66 bb 10 00          	mov    $0x10,%bx
  102798:	8e db                	mov    %ebx,%ds
  10279a:	5b                   	pop    %ebx
  10279b:	6a 00                	push   $0x0
  10279d:	6a 5b                	push   $0x5b
  10279f:	e8 2c e0 ff ff       	call   1007d0 <interrupt_handler>
  1027a4:	83 c4 08             	add    $0x8,%esp
  1027a7:	0f a9                	pop    %gs
  1027a9:	0f a1                	pop    %fs
  1027ab:	07                   	pop    %es
  1027ac:	1f                   	pop    %ds
  1027ad:	61                   	popa   
  1027ae:	fb                   	sti    
  1027af:	cf                   	iret   

001027b0 <int_handler92>:
  1027b0:	fa                   	cli    
  1027b1:	60                   	pusha  
  1027b2:	1e                   	push   %ds
  1027b3:	06                   	push   %es
  1027b4:	0f a0                	push   %fs
  1027b6:	0f a8                	push   %gs
  1027b8:	53                   	push   %ebx
  1027b9:	66 bb 10 00          	mov    $0x10,%bx
  1027bd:	8e db                	mov    %ebx,%ds
  1027bf:	5b                   	pop    %ebx
  1027c0:	6a 00                	push   $0x0
  1027c2:	6a 5c                	push   $0x5c
  1027c4:	e8 07 e0 ff ff       	call   1007d0 <interrupt_handler>
  1027c9:	83 c4 08             	add    $0x8,%esp
  1027cc:	0f a9                	pop    %gs
  1027ce:	0f a1                	pop    %fs
  1027d0:	07                   	pop    %es
  1027d1:	1f                   	pop    %ds
  1027d2:	61                   	popa   
  1027d3:	fb                   	sti    
  1027d4:	cf                   	iret   

001027d5 <int_handler93>:
  1027d5:	fa                   	cli    
  1027d6:	60                   	pusha  
  1027d7:	1e                   	push   %ds
  1027d8:	06                   	push   %es
  1027d9:	0f a0                	push   %fs
  1027db:	0f a8                	push   %gs
  1027dd:	53                   	push   %ebx
  1027de:	66 bb 10 00          	mov    $0x10,%bx
  1027e2:	8e db                	mov    %ebx,%ds
  1027e4:	5b                   	pop    %ebx
  1027e5:	6a 00                	push   $0x0
  1027e7:	6a 5d                	push   $0x5d
  1027e9:	e8 e2 df ff ff       	call   1007d0 <interrupt_handler>
  1027ee:	83 c4 08             	add    $0x8,%esp
  1027f1:	0f a9                	pop    %gs
  1027f3:	0f a1                	pop    %fs
  1027f5:	07                   	pop    %es
  1027f6:	1f                   	pop    %ds
  1027f7:	61                   	popa   
  1027f8:	fb                   	sti    
  1027f9:	cf                   	iret   

001027fa <int_handler94>:
  1027fa:	fa                   	cli    
  1027fb:	60                   	pusha  
  1027fc:	1e                   	push   %ds
  1027fd:	06                   	push   %es
  1027fe:	0f a0                	push   %fs
  102800:	0f a8                	push   %gs
  102802:	53                   	push   %ebx
  102803:	66 bb 10 00          	mov    $0x10,%bx
  102807:	8e db                	mov    %ebx,%ds
  102809:	5b                   	pop    %ebx
  10280a:	6a 00                	push   $0x0
  10280c:	6a 5e                	push   $0x5e
  10280e:	e8 bd df ff ff       	call   1007d0 <interrupt_handler>
  102813:	83 c4 08             	add    $0x8,%esp
  102816:	0f a9                	pop    %gs
  102818:	0f a1                	pop    %fs
  10281a:	07                   	pop    %es
  10281b:	1f                   	pop    %ds
  10281c:	61                   	popa   
  10281d:	fb                   	sti    
  10281e:	cf                   	iret   

0010281f <int_handler95>:
  10281f:	fa                   	cli    
  102820:	60                   	pusha  
  102821:	1e                   	push   %ds
  102822:	06                   	push   %es
  102823:	0f a0                	push   %fs
  102825:	0f a8                	push   %gs
  102827:	53                   	push   %ebx
  102828:	66 bb 10 00          	mov    $0x10,%bx
  10282c:	8e db                	mov    %ebx,%ds
  10282e:	5b                   	pop    %ebx
  10282f:	6a 00                	push   $0x0
  102831:	6a 5f                	push   $0x5f
  102833:	e8 98 df ff ff       	call   1007d0 <interrupt_handler>
  102838:	83 c4 08             	add    $0x8,%esp
  10283b:	0f a9                	pop    %gs
  10283d:	0f a1                	pop    %fs
  10283f:	07                   	pop    %es
  102840:	1f                   	pop    %ds
  102841:	61                   	popa   
  102842:	fb                   	sti    
  102843:	cf                   	iret   

00102844 <int_handler96>:
  102844:	fa                   	cli    
  102845:	60                   	pusha  
  102846:	1e                   	push   %ds
  102847:	06                   	push   %es
  102848:	0f a0                	push   %fs
  10284a:	0f a8                	push   %gs
  10284c:	53                   	push   %ebx
  10284d:	66 bb 10 00          	mov    $0x10,%bx
  102851:	8e db                	mov    %ebx,%ds
  102853:	5b                   	pop    %ebx
  102854:	6a 00                	push   $0x0
  102856:	6a 60                	push   $0x60
  102858:	e8 73 df ff ff       	call   1007d0 <interrupt_handler>
  10285d:	83 c4 08             	add    $0x8,%esp
  102860:	0f a9                	pop    %gs
  102862:	0f a1                	pop    %fs
  102864:	07                   	pop    %es
  102865:	1f                   	pop    %ds
  102866:	61                   	popa   
  102867:	fb                   	sti    
  102868:	cf                   	iret   

00102869 <int_handler97>:
  102869:	fa                   	cli    
  10286a:	60                   	pusha  
  10286b:	1e                   	push   %ds
  10286c:	06                   	push   %es
  10286d:	0f a0                	push   %fs
  10286f:	0f a8                	push   %gs
  102871:	53                   	push   %ebx
  102872:	66 bb 10 00          	mov    $0x10,%bx
  102876:	8e db                	mov    %ebx,%ds
  102878:	5b                   	pop    %ebx
  102879:	6a 00                	push   $0x0
  10287b:	6a 61                	push   $0x61
  10287d:	e8 4e df ff ff       	call   1007d0 <interrupt_handler>
  102882:	83 c4 08             	add    $0x8,%esp
  102885:	0f a9                	pop    %gs
  102887:	0f a1                	pop    %fs
  102889:	07                   	pop    %es
  10288a:	1f                   	pop    %ds
  10288b:	61                   	popa   
  10288c:	fb                   	sti    
  10288d:	cf                   	iret   

0010288e <int_handler98>:
  10288e:	fa                   	cli    
  10288f:	60                   	pusha  
  102890:	1e                   	push   %ds
  102891:	06                   	push   %es
  102892:	0f a0                	push   %fs
  102894:	0f a8                	push   %gs
  102896:	53                   	push   %ebx
  102897:	66 bb 10 00          	mov    $0x10,%bx
  10289b:	8e db                	mov    %ebx,%ds
  10289d:	5b                   	pop    %ebx
  10289e:	6a 00                	push   $0x0
  1028a0:	6a 62                	push   $0x62
  1028a2:	e8 29 df ff ff       	call   1007d0 <interrupt_handler>
  1028a7:	83 c4 08             	add    $0x8,%esp
  1028aa:	0f a9                	pop    %gs
  1028ac:	0f a1                	pop    %fs
  1028ae:	07                   	pop    %es
  1028af:	1f                   	pop    %ds
  1028b0:	61                   	popa   
  1028b1:	fb                   	sti    
  1028b2:	cf                   	iret   

001028b3 <int_handler99>:
  1028b3:	fa                   	cli    
  1028b4:	60                   	pusha  
  1028b5:	1e                   	push   %ds
  1028b6:	06                   	push   %es
  1028b7:	0f a0                	push   %fs
  1028b9:	0f a8                	push   %gs
  1028bb:	53                   	push   %ebx
  1028bc:	66 bb 10 00          	mov    $0x10,%bx
  1028c0:	8e db                	mov    %ebx,%ds
  1028c2:	5b                   	pop    %ebx
  1028c3:	6a 00                	push   $0x0
  1028c5:	6a 63                	push   $0x63
  1028c7:	e8 04 df ff ff       	call   1007d0 <interrupt_handler>
  1028cc:	83 c4 08             	add    $0x8,%esp
  1028cf:	0f a9                	pop    %gs
  1028d1:	0f a1                	pop    %fs
  1028d3:	07                   	pop    %es
  1028d4:	1f                   	pop    %ds
  1028d5:	61                   	popa   
  1028d6:	fb                   	sti    
  1028d7:	cf                   	iret   

001028d8 <int_handler100>:
  1028d8:	fa                   	cli    
  1028d9:	60                   	pusha  
  1028da:	1e                   	push   %ds
  1028db:	06                   	push   %es
  1028dc:	0f a0                	push   %fs
  1028de:	0f a8                	push   %gs
  1028e0:	53                   	push   %ebx
  1028e1:	66 bb 10 00          	mov    $0x10,%bx
  1028e5:	8e db                	mov    %ebx,%ds
  1028e7:	5b                   	pop    %ebx
  1028e8:	6a 00                	push   $0x0
  1028ea:	6a 64                	push   $0x64
  1028ec:	e8 df de ff ff       	call   1007d0 <interrupt_handler>
  1028f1:	83 c4 08             	add    $0x8,%esp
  1028f4:	0f a9                	pop    %gs
  1028f6:	0f a1                	pop    %fs
  1028f8:	07                   	pop    %es
  1028f9:	1f                   	pop    %ds
  1028fa:	61                   	popa   
  1028fb:	fb                   	sti    
  1028fc:	cf                   	iret   

001028fd <int_handler101>:
  1028fd:	fa                   	cli    
  1028fe:	60                   	pusha  
  1028ff:	1e                   	push   %ds
  102900:	06                   	push   %es
  102901:	0f a0                	push   %fs
  102903:	0f a8                	push   %gs
  102905:	53                   	push   %ebx
  102906:	66 bb 10 00          	mov    $0x10,%bx
  10290a:	8e db                	mov    %ebx,%ds
  10290c:	5b                   	pop    %ebx
  10290d:	6a 00                	push   $0x0
  10290f:	6a 65                	push   $0x65
  102911:	e8 ba de ff ff       	call   1007d0 <interrupt_handler>
  102916:	83 c4 08             	add    $0x8,%esp
  102919:	0f a9                	pop    %gs
  10291b:	0f a1                	pop    %fs
  10291d:	07                   	pop    %es
  10291e:	1f                   	pop    %ds
  10291f:	61                   	popa   
  102920:	fb                   	sti    
  102921:	cf                   	iret   

00102922 <int_handler102>:
  102922:	fa                   	cli    
  102923:	60                   	pusha  
  102924:	1e                   	push   %ds
  102925:	06                   	push   %es
  102926:	0f a0                	push   %fs
  102928:	0f a8                	push   %gs
  10292a:	53                   	push   %ebx
  10292b:	66 bb 10 00          	mov    $0x10,%bx
  10292f:	8e db                	mov    %ebx,%ds
  102931:	5b                   	pop    %ebx
  102932:	6a 00                	push   $0x0
  102934:	6a 66                	push   $0x66
  102936:	e8 95 de ff ff       	call   1007d0 <interrupt_handler>
  10293b:	83 c4 08             	add    $0x8,%esp
  10293e:	0f a9                	pop    %gs
  102940:	0f a1                	pop    %fs
  102942:	07                   	pop    %es
  102943:	1f                   	pop    %ds
  102944:	61                   	popa   
  102945:	fb                   	sti    
  102946:	cf                   	iret   

00102947 <int_handler103>:
  102947:	fa                   	cli    
  102948:	60                   	pusha  
  102949:	1e                   	push   %ds
  10294a:	06                   	push   %es
  10294b:	0f a0                	push   %fs
  10294d:	0f a8                	push   %gs
  10294f:	53                   	push   %ebx
  102950:	66 bb 10 00          	mov    $0x10,%bx
  102954:	8e db                	mov    %ebx,%ds
  102956:	5b                   	pop    %ebx
  102957:	6a 00                	push   $0x0
  102959:	6a 67                	push   $0x67
  10295b:	e8 70 de ff ff       	call   1007d0 <interrupt_handler>
  102960:	83 c4 08             	add    $0x8,%esp
  102963:	0f a9                	pop    %gs
  102965:	0f a1                	pop    %fs
  102967:	07                   	pop    %es
  102968:	1f                   	pop    %ds
  102969:	61                   	popa   
  10296a:	fb                   	sti    
  10296b:	cf                   	iret   

0010296c <int_handler104>:
  10296c:	fa                   	cli    
  10296d:	60                   	pusha  
  10296e:	1e                   	push   %ds
  10296f:	06                   	push   %es
  102970:	0f a0                	push   %fs
  102972:	0f a8                	push   %gs
  102974:	53                   	push   %ebx
  102975:	66 bb 10 00          	mov    $0x10,%bx
  102979:	8e db                	mov    %ebx,%ds
  10297b:	5b                   	pop    %ebx
  10297c:	6a 00                	push   $0x0
  10297e:	6a 68                	push   $0x68
  102980:	e8 4b de ff ff       	call   1007d0 <interrupt_handler>
  102985:	83 c4 08             	add    $0x8,%esp
  102988:	0f a9                	pop    %gs
  10298a:	0f a1                	pop    %fs
  10298c:	07                   	pop    %es
  10298d:	1f                   	pop    %ds
  10298e:	61                   	popa   
  10298f:	fb                   	sti    
  102990:	cf                   	iret   

00102991 <int_handler105>:
  102991:	fa                   	cli    
  102992:	60                   	pusha  
  102993:	1e                   	push   %ds
  102994:	06                   	push   %es
  102995:	0f a0                	push   %fs
  102997:	0f a8                	push   %gs
  102999:	53                   	push   %ebx
  10299a:	66 bb 10 00          	mov    $0x10,%bx
  10299e:	8e db                	mov    %ebx,%ds
  1029a0:	5b                   	pop    %ebx
  1029a1:	6a 00                	push   $0x0
  1029a3:	6a 69                	push   $0x69
  1029a5:	e8 26 de ff ff       	call   1007d0 <interrupt_handler>
  1029aa:	83 c4 08             	add    $0x8,%esp
  1029ad:	0f a9                	pop    %gs
  1029af:	0f a1                	pop    %fs
  1029b1:	07                   	pop    %es
  1029b2:	1f                   	pop    %ds
  1029b3:	61                   	popa   
  1029b4:	fb                   	sti    
  1029b5:	cf                   	iret   

001029b6 <int_handler106>:
  1029b6:	fa                   	cli    
  1029b7:	60                   	pusha  
  1029b8:	1e                   	push   %ds
  1029b9:	06                   	push   %es
  1029ba:	0f a0                	push   %fs
  1029bc:	0f a8                	push   %gs
  1029be:	53                   	push   %ebx
  1029bf:	66 bb 10 00          	mov    $0x10,%bx
  1029c3:	8e db                	mov    %ebx,%ds
  1029c5:	5b                   	pop    %ebx
  1029c6:	6a 00                	push   $0x0
  1029c8:	6a 6a                	push   $0x6a
  1029ca:	e8 01 de ff ff       	call   1007d0 <interrupt_handler>
  1029cf:	83 c4 08             	add    $0x8,%esp
  1029d2:	0f a9                	pop    %gs
  1029d4:	0f a1                	pop    %fs
  1029d6:	07                   	pop    %es
  1029d7:	1f                   	pop    %ds
  1029d8:	61                   	popa   
  1029d9:	fb                   	sti    
  1029da:	cf                   	iret   

001029db <int_handler107>:
  1029db:	fa                   	cli    
  1029dc:	60                   	pusha  
  1029dd:	1e                   	push   %ds
  1029de:	06                   	push   %es
  1029df:	0f a0                	push   %fs
  1029e1:	0f a8                	push   %gs
  1029e3:	53                   	push   %ebx
  1029e4:	66 bb 10 00          	mov    $0x10,%bx
  1029e8:	8e db                	mov    %ebx,%ds
  1029ea:	5b                   	pop    %ebx
  1029eb:	6a 00                	push   $0x0
  1029ed:	6a 6b                	push   $0x6b
  1029ef:	e8 dc dd ff ff       	call   1007d0 <interrupt_handler>
  1029f4:	83 c4 08             	add    $0x8,%esp
  1029f7:	0f a9                	pop    %gs
  1029f9:	0f a1                	pop    %fs
  1029fb:	07                   	pop    %es
  1029fc:	1f                   	pop    %ds
  1029fd:	61                   	popa   
  1029fe:	fb                   	sti    
  1029ff:	cf                   	iret   

00102a00 <int_handler108>:
  102a00:	fa                   	cli    
  102a01:	60                   	pusha  
  102a02:	1e                   	push   %ds
  102a03:	06                   	push   %es
  102a04:	0f a0                	push   %fs
  102a06:	0f a8                	push   %gs
  102a08:	53                   	push   %ebx
  102a09:	66 bb 10 00          	mov    $0x10,%bx
  102a0d:	8e db                	mov    %ebx,%ds
  102a0f:	5b                   	pop    %ebx
  102a10:	6a 00                	push   $0x0
  102a12:	6a 6c                	push   $0x6c
  102a14:	e8 b7 dd ff ff       	call   1007d0 <interrupt_handler>
  102a19:	83 c4 08             	add    $0x8,%esp
  102a1c:	0f a9                	pop    %gs
  102a1e:	0f a1                	pop    %fs
  102a20:	07                   	pop    %es
  102a21:	1f                   	pop    %ds
  102a22:	61                   	popa   
  102a23:	fb                   	sti    
  102a24:	cf                   	iret   

00102a25 <int_handler109>:
  102a25:	fa                   	cli    
  102a26:	60                   	pusha  
  102a27:	1e                   	push   %ds
  102a28:	06                   	push   %es
  102a29:	0f a0                	push   %fs
  102a2b:	0f a8                	push   %gs
  102a2d:	53                   	push   %ebx
  102a2e:	66 bb 10 00          	mov    $0x10,%bx
  102a32:	8e db                	mov    %ebx,%ds
  102a34:	5b                   	pop    %ebx
  102a35:	6a 00                	push   $0x0
  102a37:	6a 6d                	push   $0x6d
  102a39:	e8 92 dd ff ff       	call   1007d0 <interrupt_handler>
  102a3e:	83 c4 08             	add    $0x8,%esp
  102a41:	0f a9                	pop    %gs
  102a43:	0f a1                	pop    %fs
  102a45:	07                   	pop    %es
  102a46:	1f                   	pop    %ds
  102a47:	61                   	popa   
  102a48:	fb                   	sti    
  102a49:	cf                   	iret   

00102a4a <int_handler110>:
  102a4a:	fa                   	cli    
  102a4b:	60                   	pusha  
  102a4c:	1e                   	push   %ds
  102a4d:	06                   	push   %es
  102a4e:	0f a0                	push   %fs
  102a50:	0f a8                	push   %gs
  102a52:	53                   	push   %ebx
  102a53:	66 bb 10 00          	mov    $0x10,%bx
  102a57:	8e db                	mov    %ebx,%ds
  102a59:	5b                   	pop    %ebx
  102a5a:	6a 00                	push   $0x0
  102a5c:	6a 6e                	push   $0x6e
  102a5e:	e8 6d dd ff ff       	call   1007d0 <interrupt_handler>
  102a63:	83 c4 08             	add    $0x8,%esp
  102a66:	0f a9                	pop    %gs
  102a68:	0f a1                	pop    %fs
  102a6a:	07                   	pop    %es
  102a6b:	1f                   	pop    %ds
  102a6c:	61                   	popa   
  102a6d:	fb                   	sti    
  102a6e:	cf                   	iret   

00102a6f <int_handler111>:
  102a6f:	fa                   	cli    
  102a70:	60                   	pusha  
  102a71:	1e                   	push   %ds
  102a72:	06                   	push   %es
  102a73:	0f a0                	push   %fs
  102a75:	0f a8                	push   %gs
  102a77:	53                   	push   %ebx
  102a78:	66 bb 10 00          	mov    $0x10,%bx
  102a7c:	8e db                	mov    %ebx,%ds
  102a7e:	5b                   	pop    %ebx
  102a7f:	6a 00                	push   $0x0
  102a81:	6a 6f                	push   $0x6f
  102a83:	e8 48 dd ff ff       	call   1007d0 <interrupt_handler>
  102a88:	83 c4 08             	add    $0x8,%esp
  102a8b:	0f a9                	pop    %gs
  102a8d:	0f a1                	pop    %fs
  102a8f:	07                   	pop    %es
  102a90:	1f                   	pop    %ds
  102a91:	61                   	popa   
  102a92:	fb                   	sti    
  102a93:	cf                   	iret   

00102a94 <int_handler112>:
  102a94:	fa                   	cli    
  102a95:	60                   	pusha  
  102a96:	1e                   	push   %ds
  102a97:	06                   	push   %es
  102a98:	0f a0                	push   %fs
  102a9a:	0f a8                	push   %gs
  102a9c:	53                   	push   %ebx
  102a9d:	66 bb 10 00          	mov    $0x10,%bx
  102aa1:	8e db                	mov    %ebx,%ds
  102aa3:	5b                   	pop    %ebx
  102aa4:	6a 00                	push   $0x0
  102aa6:	6a 70                	push   $0x70
  102aa8:	e8 23 dd ff ff       	call   1007d0 <interrupt_handler>
  102aad:	83 c4 08             	add    $0x8,%esp
  102ab0:	0f a9                	pop    %gs
  102ab2:	0f a1                	pop    %fs
  102ab4:	07                   	pop    %es
  102ab5:	1f                   	pop    %ds
  102ab6:	61                   	popa   
  102ab7:	fb                   	sti    
  102ab8:	cf                   	iret   

00102ab9 <int_handler113>:
  102ab9:	fa                   	cli    
  102aba:	60                   	pusha  
  102abb:	1e                   	push   %ds
  102abc:	06                   	push   %es
  102abd:	0f a0                	push   %fs
  102abf:	0f a8                	push   %gs
  102ac1:	53                   	push   %ebx
  102ac2:	66 bb 10 00          	mov    $0x10,%bx
  102ac6:	8e db                	mov    %ebx,%ds
  102ac8:	5b                   	pop    %ebx
  102ac9:	6a 00                	push   $0x0
  102acb:	6a 71                	push   $0x71
  102acd:	e8 fe dc ff ff       	call   1007d0 <interrupt_handler>
  102ad2:	83 c4 08             	add    $0x8,%esp
  102ad5:	0f a9                	pop    %gs
  102ad7:	0f a1                	pop    %fs
  102ad9:	07                   	pop    %es
  102ada:	1f                   	pop    %ds
  102adb:	61                   	popa   
  102adc:	fb                   	sti    
  102add:	cf                   	iret   

00102ade <int_handler114>:
  102ade:	fa                   	cli    
  102adf:	60                   	pusha  
  102ae0:	1e                   	push   %ds
  102ae1:	06                   	push   %es
  102ae2:	0f a0                	push   %fs
  102ae4:	0f a8                	push   %gs
  102ae6:	53                   	push   %ebx
  102ae7:	66 bb 10 00          	mov    $0x10,%bx
  102aeb:	8e db                	mov    %ebx,%ds
  102aed:	5b                   	pop    %ebx
  102aee:	6a 00                	push   $0x0
  102af0:	6a 72                	push   $0x72
  102af2:	e8 d9 dc ff ff       	call   1007d0 <interrupt_handler>
  102af7:	83 c4 08             	add    $0x8,%esp
  102afa:	0f a9                	pop    %gs
  102afc:	0f a1                	pop    %fs
  102afe:	07                   	pop    %es
  102aff:	1f                   	pop    %ds
  102b00:	61                   	popa   
  102b01:	fb                   	sti    
  102b02:	cf                   	iret   

00102b03 <int_handler115>:
  102b03:	fa                   	cli    
  102b04:	60                   	pusha  
  102b05:	1e                   	push   %ds
  102b06:	06                   	push   %es
  102b07:	0f a0                	push   %fs
  102b09:	0f a8                	push   %gs
  102b0b:	53                   	push   %ebx
  102b0c:	66 bb 10 00          	mov    $0x10,%bx
  102b10:	8e db                	mov    %ebx,%ds
  102b12:	5b                   	pop    %ebx
  102b13:	6a 00                	push   $0x0
  102b15:	6a 73                	push   $0x73
  102b17:	e8 b4 dc ff ff       	call   1007d0 <interrupt_handler>
  102b1c:	83 c4 08             	add    $0x8,%esp
  102b1f:	0f a9                	pop    %gs
  102b21:	0f a1                	pop    %fs
  102b23:	07                   	pop    %es
  102b24:	1f                   	pop    %ds
  102b25:	61                   	popa   
  102b26:	fb                   	sti    
  102b27:	cf                   	iret   

00102b28 <int_handler116>:
  102b28:	fa                   	cli    
  102b29:	60                   	pusha  
  102b2a:	1e                   	push   %ds
  102b2b:	06                   	push   %es
  102b2c:	0f a0                	push   %fs
  102b2e:	0f a8                	push   %gs
  102b30:	53                   	push   %ebx
  102b31:	66 bb 10 00          	mov    $0x10,%bx
  102b35:	8e db                	mov    %ebx,%ds
  102b37:	5b                   	pop    %ebx
  102b38:	6a 00                	push   $0x0
  102b3a:	6a 74                	push   $0x74
  102b3c:	e8 8f dc ff ff       	call   1007d0 <interrupt_handler>
  102b41:	83 c4 08             	add    $0x8,%esp
  102b44:	0f a9                	pop    %gs
  102b46:	0f a1                	pop    %fs
  102b48:	07                   	pop    %es
  102b49:	1f                   	pop    %ds
  102b4a:	61                   	popa   
  102b4b:	fb                   	sti    
  102b4c:	cf                   	iret   

00102b4d <int_handler117>:
  102b4d:	fa                   	cli    
  102b4e:	60                   	pusha  
  102b4f:	1e                   	push   %ds
  102b50:	06                   	push   %es
  102b51:	0f a0                	push   %fs
  102b53:	0f a8                	push   %gs
  102b55:	53                   	push   %ebx
  102b56:	66 bb 10 00          	mov    $0x10,%bx
  102b5a:	8e db                	mov    %ebx,%ds
  102b5c:	5b                   	pop    %ebx
  102b5d:	6a 00                	push   $0x0
  102b5f:	6a 75                	push   $0x75
  102b61:	e8 6a dc ff ff       	call   1007d0 <interrupt_handler>
  102b66:	83 c4 08             	add    $0x8,%esp
  102b69:	0f a9                	pop    %gs
  102b6b:	0f a1                	pop    %fs
  102b6d:	07                   	pop    %es
  102b6e:	1f                   	pop    %ds
  102b6f:	61                   	popa   
  102b70:	fb                   	sti    
  102b71:	cf                   	iret   

00102b72 <int_handler118>:
  102b72:	fa                   	cli    
  102b73:	60                   	pusha  
  102b74:	1e                   	push   %ds
  102b75:	06                   	push   %es
  102b76:	0f a0                	push   %fs
  102b78:	0f a8                	push   %gs
  102b7a:	53                   	push   %ebx
  102b7b:	66 bb 10 00          	mov    $0x10,%bx
  102b7f:	8e db                	mov    %ebx,%ds
  102b81:	5b                   	pop    %ebx
  102b82:	6a 00                	push   $0x0
  102b84:	6a 76                	push   $0x76
  102b86:	e8 45 dc ff ff       	call   1007d0 <interrupt_handler>
  102b8b:	83 c4 08             	add    $0x8,%esp
  102b8e:	0f a9                	pop    %gs
  102b90:	0f a1                	pop    %fs
  102b92:	07                   	pop    %es
  102b93:	1f                   	pop    %ds
  102b94:	61                   	popa   
  102b95:	fb                   	sti    
  102b96:	cf                   	iret   

00102b97 <int_handler119>:
  102b97:	fa                   	cli    
  102b98:	60                   	pusha  
  102b99:	1e                   	push   %ds
  102b9a:	06                   	push   %es
  102b9b:	0f a0                	push   %fs
  102b9d:	0f a8                	push   %gs
  102b9f:	53                   	push   %ebx
  102ba0:	66 bb 10 00          	mov    $0x10,%bx
  102ba4:	8e db                	mov    %ebx,%ds
  102ba6:	5b                   	pop    %ebx
  102ba7:	6a 00                	push   $0x0
  102ba9:	6a 77                	push   $0x77
  102bab:	e8 20 dc ff ff       	call   1007d0 <interrupt_handler>
  102bb0:	83 c4 08             	add    $0x8,%esp
  102bb3:	0f a9                	pop    %gs
  102bb5:	0f a1                	pop    %fs
  102bb7:	07                   	pop    %es
  102bb8:	1f                   	pop    %ds
  102bb9:	61                   	popa   
  102bba:	fb                   	sti    
  102bbb:	cf                   	iret   

00102bbc <int_handler120>:
  102bbc:	fa                   	cli    
  102bbd:	60                   	pusha  
  102bbe:	1e                   	push   %ds
  102bbf:	06                   	push   %es
  102bc0:	0f a0                	push   %fs
  102bc2:	0f a8                	push   %gs
  102bc4:	53                   	push   %ebx
  102bc5:	66 bb 10 00          	mov    $0x10,%bx
  102bc9:	8e db                	mov    %ebx,%ds
  102bcb:	5b                   	pop    %ebx
  102bcc:	6a 00                	push   $0x0
  102bce:	6a 78                	push   $0x78
  102bd0:	e8 fb db ff ff       	call   1007d0 <interrupt_handler>
  102bd5:	83 c4 08             	add    $0x8,%esp
  102bd8:	0f a9                	pop    %gs
  102bda:	0f a1                	pop    %fs
  102bdc:	07                   	pop    %es
  102bdd:	1f                   	pop    %ds
  102bde:	61                   	popa   
  102bdf:	fb                   	sti    
  102be0:	cf                   	iret   

00102be1 <int_handler121>:
  102be1:	fa                   	cli    
  102be2:	60                   	pusha  
  102be3:	1e                   	push   %ds
  102be4:	06                   	push   %es
  102be5:	0f a0                	push   %fs
  102be7:	0f a8                	push   %gs
  102be9:	53                   	push   %ebx
  102bea:	66 bb 10 00          	mov    $0x10,%bx
  102bee:	8e db                	mov    %ebx,%ds
  102bf0:	5b                   	pop    %ebx
  102bf1:	6a 00                	push   $0x0
  102bf3:	6a 79                	push   $0x79
  102bf5:	e8 d6 db ff ff       	call   1007d0 <interrupt_handler>
  102bfa:	83 c4 08             	add    $0x8,%esp
  102bfd:	0f a9                	pop    %gs
  102bff:	0f a1                	pop    %fs
  102c01:	07                   	pop    %es
  102c02:	1f                   	pop    %ds
  102c03:	61                   	popa   
  102c04:	fb                   	sti    
  102c05:	cf                   	iret   

00102c06 <int_handler122>:
  102c06:	fa                   	cli    
  102c07:	60                   	pusha  
  102c08:	1e                   	push   %ds
  102c09:	06                   	push   %es
  102c0a:	0f a0                	push   %fs
  102c0c:	0f a8                	push   %gs
  102c0e:	53                   	push   %ebx
  102c0f:	66 bb 10 00          	mov    $0x10,%bx
  102c13:	8e db                	mov    %ebx,%ds
  102c15:	5b                   	pop    %ebx
  102c16:	6a 00                	push   $0x0
  102c18:	6a 7a                	push   $0x7a
  102c1a:	e8 b1 db ff ff       	call   1007d0 <interrupt_handler>
  102c1f:	83 c4 08             	add    $0x8,%esp
  102c22:	0f a9                	pop    %gs
  102c24:	0f a1                	pop    %fs
  102c26:	07                   	pop    %es
  102c27:	1f                   	pop    %ds
  102c28:	61                   	popa   
  102c29:	fb                   	sti    
  102c2a:	cf                   	iret   

00102c2b <int_handler123>:
  102c2b:	fa                   	cli    
  102c2c:	60                   	pusha  
  102c2d:	1e                   	push   %ds
  102c2e:	06                   	push   %es
  102c2f:	0f a0                	push   %fs
  102c31:	0f a8                	push   %gs
  102c33:	53                   	push   %ebx
  102c34:	66 bb 10 00          	mov    $0x10,%bx
  102c38:	8e db                	mov    %ebx,%ds
  102c3a:	5b                   	pop    %ebx
  102c3b:	6a 00                	push   $0x0
  102c3d:	6a 7b                	push   $0x7b
  102c3f:	e8 8c db ff ff       	call   1007d0 <interrupt_handler>
  102c44:	83 c4 08             	add    $0x8,%esp
  102c47:	0f a9                	pop    %gs
  102c49:	0f a1                	pop    %fs
  102c4b:	07                   	pop    %es
  102c4c:	1f                   	pop    %ds
  102c4d:	61                   	popa   
  102c4e:	fb                   	sti    
  102c4f:	cf                   	iret   

00102c50 <int_handler124>:
  102c50:	fa                   	cli    
  102c51:	60                   	pusha  
  102c52:	1e                   	push   %ds
  102c53:	06                   	push   %es
  102c54:	0f a0                	push   %fs
  102c56:	0f a8                	push   %gs
  102c58:	53                   	push   %ebx
  102c59:	66 bb 10 00          	mov    $0x10,%bx
  102c5d:	8e db                	mov    %ebx,%ds
  102c5f:	5b                   	pop    %ebx
  102c60:	6a 00                	push   $0x0
  102c62:	6a 7c                	push   $0x7c
  102c64:	e8 67 db ff ff       	call   1007d0 <interrupt_handler>
  102c69:	83 c4 08             	add    $0x8,%esp
  102c6c:	0f a9                	pop    %gs
  102c6e:	0f a1                	pop    %fs
  102c70:	07                   	pop    %es
  102c71:	1f                   	pop    %ds
  102c72:	61                   	popa   
  102c73:	fb                   	sti    
  102c74:	cf                   	iret   

00102c75 <int_handler125>:
  102c75:	fa                   	cli    
  102c76:	60                   	pusha  
  102c77:	1e                   	push   %ds
  102c78:	06                   	push   %es
  102c79:	0f a0                	push   %fs
  102c7b:	0f a8                	push   %gs
  102c7d:	53                   	push   %ebx
  102c7e:	66 bb 10 00          	mov    $0x10,%bx
  102c82:	8e db                	mov    %ebx,%ds
  102c84:	5b                   	pop    %ebx
  102c85:	6a 00                	push   $0x0
  102c87:	6a 7d                	push   $0x7d
  102c89:	e8 42 db ff ff       	call   1007d0 <interrupt_handler>
  102c8e:	83 c4 08             	add    $0x8,%esp
  102c91:	0f a9                	pop    %gs
  102c93:	0f a1                	pop    %fs
  102c95:	07                   	pop    %es
  102c96:	1f                   	pop    %ds
  102c97:	61                   	popa   
  102c98:	fb                   	sti    
  102c99:	cf                   	iret   

00102c9a <int_handler126>:
  102c9a:	fa                   	cli    
  102c9b:	60                   	pusha  
  102c9c:	1e                   	push   %ds
  102c9d:	06                   	push   %es
  102c9e:	0f a0                	push   %fs
  102ca0:	0f a8                	push   %gs
  102ca2:	53                   	push   %ebx
  102ca3:	66 bb 10 00          	mov    $0x10,%bx
  102ca7:	8e db                	mov    %ebx,%ds
  102ca9:	5b                   	pop    %ebx
  102caa:	6a 00                	push   $0x0
  102cac:	6a 7e                	push   $0x7e
  102cae:	e8 1d db ff ff       	call   1007d0 <interrupt_handler>
  102cb3:	83 c4 08             	add    $0x8,%esp
  102cb6:	0f a9                	pop    %gs
  102cb8:	0f a1                	pop    %fs
  102cba:	07                   	pop    %es
  102cbb:	1f                   	pop    %ds
  102cbc:	61                   	popa   
  102cbd:	fb                   	sti    
  102cbe:	cf                   	iret   

00102cbf <int_handler127>:
  102cbf:	fa                   	cli    
  102cc0:	60                   	pusha  
  102cc1:	1e                   	push   %ds
  102cc2:	06                   	push   %es
  102cc3:	0f a0                	push   %fs
  102cc5:	0f a8                	push   %gs
  102cc7:	53                   	push   %ebx
  102cc8:	66 bb 10 00          	mov    $0x10,%bx
  102ccc:	8e db                	mov    %ebx,%ds
  102cce:	5b                   	pop    %ebx
  102ccf:	6a 00                	push   $0x0
  102cd1:	6a 7f                	push   $0x7f
  102cd3:	e8 f8 da ff ff       	call   1007d0 <interrupt_handler>
  102cd8:	83 c4 08             	add    $0x8,%esp
  102cdb:	0f a9                	pop    %gs
  102cdd:	0f a1                	pop    %fs
  102cdf:	07                   	pop    %es
  102ce0:	1f                   	pop    %ds
  102ce1:	61                   	popa   
  102ce2:	fb                   	sti    
  102ce3:	cf                   	iret   

00102ce4 <int_handler128>:
  102ce4:	fa                   	cli    
  102ce5:	60                   	pusha  
  102ce6:	1e                   	push   %ds
  102ce7:	06                   	push   %es
  102ce8:	0f a0                	push   %fs
  102cea:	0f a8                	push   %gs
  102cec:	53                   	push   %ebx
  102ced:	66 bb 10 00          	mov    $0x10,%bx
  102cf1:	8e db                	mov    %ebx,%ds
  102cf3:	5b                   	pop    %ebx
  102cf4:	6a 00                	push   $0x0
  102cf6:	68 80 00 00 00       	push   $0x80
  102cfb:	e8 d0 da ff ff       	call   1007d0 <interrupt_handler>
  102d00:	83 c4 08             	add    $0x8,%esp
  102d03:	0f a9                	pop    %gs
  102d05:	0f a1                	pop    %fs
  102d07:	07                   	pop    %es
  102d08:	1f                   	pop    %ds
  102d09:	61                   	popa   
  102d0a:	fb                   	sti    
  102d0b:	cf                   	iret   

00102d0c <int_handler129>:
  102d0c:	fa                   	cli    
  102d0d:	60                   	pusha  
  102d0e:	1e                   	push   %ds
  102d0f:	06                   	push   %es
  102d10:	0f a0                	push   %fs
  102d12:	0f a8                	push   %gs
  102d14:	53                   	push   %ebx
  102d15:	66 bb 10 00          	mov    $0x10,%bx
  102d19:	8e db                	mov    %ebx,%ds
  102d1b:	5b                   	pop    %ebx
  102d1c:	6a 00                	push   $0x0
  102d1e:	68 81 00 00 00       	push   $0x81
  102d23:	e8 a8 da ff ff       	call   1007d0 <interrupt_handler>
  102d28:	83 c4 08             	add    $0x8,%esp
  102d2b:	0f a9                	pop    %gs
  102d2d:	0f a1                	pop    %fs
  102d2f:	07                   	pop    %es
  102d30:	1f                   	pop    %ds
  102d31:	61                   	popa   
  102d32:	fb                   	sti    
  102d33:	cf                   	iret   

00102d34 <int_handler130>:
  102d34:	fa                   	cli    
  102d35:	60                   	pusha  
  102d36:	1e                   	push   %ds
  102d37:	06                   	push   %es
  102d38:	0f a0                	push   %fs
  102d3a:	0f a8                	push   %gs
  102d3c:	53                   	push   %ebx
  102d3d:	66 bb 10 00          	mov    $0x10,%bx
  102d41:	8e db                	mov    %ebx,%ds
  102d43:	5b                   	pop    %ebx
  102d44:	6a 00                	push   $0x0
  102d46:	68 82 00 00 00       	push   $0x82
  102d4b:	e8 80 da ff ff       	call   1007d0 <interrupt_handler>
  102d50:	83 c4 08             	add    $0x8,%esp
  102d53:	0f a9                	pop    %gs
  102d55:	0f a1                	pop    %fs
  102d57:	07                   	pop    %es
  102d58:	1f                   	pop    %ds
  102d59:	61                   	popa   
  102d5a:	fb                   	sti    
  102d5b:	cf                   	iret   

00102d5c <int_handler131>:
  102d5c:	fa                   	cli    
  102d5d:	60                   	pusha  
  102d5e:	1e                   	push   %ds
  102d5f:	06                   	push   %es
  102d60:	0f a0                	push   %fs
  102d62:	0f a8                	push   %gs
  102d64:	53                   	push   %ebx
  102d65:	66 bb 10 00          	mov    $0x10,%bx
  102d69:	8e db                	mov    %ebx,%ds
  102d6b:	5b                   	pop    %ebx
  102d6c:	6a 00                	push   $0x0
  102d6e:	68 83 00 00 00       	push   $0x83
  102d73:	e8 58 da ff ff       	call   1007d0 <interrupt_handler>
  102d78:	83 c4 08             	add    $0x8,%esp
  102d7b:	0f a9                	pop    %gs
  102d7d:	0f a1                	pop    %fs
  102d7f:	07                   	pop    %es
  102d80:	1f                   	pop    %ds
  102d81:	61                   	popa   
  102d82:	fb                   	sti    
  102d83:	cf                   	iret   

00102d84 <int_handler132>:
  102d84:	fa                   	cli    
  102d85:	60                   	pusha  
  102d86:	1e                   	push   %ds
  102d87:	06                   	push   %es
  102d88:	0f a0                	push   %fs
  102d8a:	0f a8                	push   %gs
  102d8c:	53                   	push   %ebx
  102d8d:	66 bb 10 00          	mov    $0x10,%bx
  102d91:	8e db                	mov    %ebx,%ds
  102d93:	5b                   	pop    %ebx
  102d94:	6a 00                	push   $0x0
  102d96:	68 84 00 00 00       	push   $0x84
  102d9b:	e8 30 da ff ff       	call   1007d0 <interrupt_handler>
  102da0:	83 c4 08             	add    $0x8,%esp
  102da3:	0f a9                	pop    %gs
  102da5:	0f a1                	pop    %fs
  102da7:	07                   	pop    %es
  102da8:	1f                   	pop    %ds
  102da9:	61                   	popa   
  102daa:	fb                   	sti    
  102dab:	cf                   	iret   

00102dac <int_handler133>:
  102dac:	fa                   	cli    
  102dad:	60                   	pusha  
  102dae:	1e                   	push   %ds
  102daf:	06                   	push   %es
  102db0:	0f a0                	push   %fs
  102db2:	0f a8                	push   %gs
  102db4:	53                   	push   %ebx
  102db5:	66 bb 10 00          	mov    $0x10,%bx
  102db9:	8e db                	mov    %ebx,%ds
  102dbb:	5b                   	pop    %ebx
  102dbc:	6a 00                	push   $0x0
  102dbe:	68 85 00 00 00       	push   $0x85
  102dc3:	e8 08 da ff ff       	call   1007d0 <interrupt_handler>
  102dc8:	83 c4 08             	add    $0x8,%esp
  102dcb:	0f a9                	pop    %gs
  102dcd:	0f a1                	pop    %fs
  102dcf:	07                   	pop    %es
  102dd0:	1f                   	pop    %ds
  102dd1:	61                   	popa   
  102dd2:	fb                   	sti    
  102dd3:	cf                   	iret   

00102dd4 <int_handler134>:
  102dd4:	fa                   	cli    
  102dd5:	60                   	pusha  
  102dd6:	1e                   	push   %ds
  102dd7:	06                   	push   %es
  102dd8:	0f a0                	push   %fs
  102dda:	0f a8                	push   %gs
  102ddc:	53                   	push   %ebx
  102ddd:	66 bb 10 00          	mov    $0x10,%bx
  102de1:	8e db                	mov    %ebx,%ds
  102de3:	5b                   	pop    %ebx
  102de4:	6a 00                	push   $0x0
  102de6:	68 86 00 00 00       	push   $0x86
  102deb:	e8 e0 d9 ff ff       	call   1007d0 <interrupt_handler>
  102df0:	83 c4 08             	add    $0x8,%esp
  102df3:	0f a9                	pop    %gs
  102df5:	0f a1                	pop    %fs
  102df7:	07                   	pop    %es
  102df8:	1f                   	pop    %ds
  102df9:	61                   	popa   
  102dfa:	fb                   	sti    
  102dfb:	cf                   	iret   

00102dfc <int_handler135>:
  102dfc:	fa                   	cli    
  102dfd:	60                   	pusha  
  102dfe:	1e                   	push   %ds
  102dff:	06                   	push   %es
  102e00:	0f a0                	push   %fs
  102e02:	0f a8                	push   %gs
  102e04:	53                   	push   %ebx
  102e05:	66 bb 10 00          	mov    $0x10,%bx
  102e09:	8e db                	mov    %ebx,%ds
  102e0b:	5b                   	pop    %ebx
  102e0c:	6a 00                	push   $0x0
  102e0e:	68 87 00 00 00       	push   $0x87
  102e13:	e8 b8 d9 ff ff       	call   1007d0 <interrupt_handler>
  102e18:	83 c4 08             	add    $0x8,%esp
  102e1b:	0f a9                	pop    %gs
  102e1d:	0f a1                	pop    %fs
  102e1f:	07                   	pop    %es
  102e20:	1f                   	pop    %ds
  102e21:	61                   	popa   
  102e22:	fb                   	sti    
  102e23:	cf                   	iret   

00102e24 <int_handler136>:
  102e24:	fa                   	cli    
  102e25:	60                   	pusha  
  102e26:	1e                   	push   %ds
  102e27:	06                   	push   %es
  102e28:	0f a0                	push   %fs
  102e2a:	0f a8                	push   %gs
  102e2c:	53                   	push   %ebx
  102e2d:	66 bb 10 00          	mov    $0x10,%bx
  102e31:	8e db                	mov    %ebx,%ds
  102e33:	5b                   	pop    %ebx
  102e34:	6a 00                	push   $0x0
  102e36:	68 88 00 00 00       	push   $0x88
  102e3b:	e8 90 d9 ff ff       	call   1007d0 <interrupt_handler>
  102e40:	83 c4 08             	add    $0x8,%esp
  102e43:	0f a9                	pop    %gs
  102e45:	0f a1                	pop    %fs
  102e47:	07                   	pop    %es
  102e48:	1f                   	pop    %ds
  102e49:	61                   	popa   
  102e4a:	fb                   	sti    
  102e4b:	cf                   	iret   

00102e4c <int_handler137>:
  102e4c:	fa                   	cli    
  102e4d:	60                   	pusha  
  102e4e:	1e                   	push   %ds
  102e4f:	06                   	push   %es
  102e50:	0f a0                	push   %fs
  102e52:	0f a8                	push   %gs
  102e54:	53                   	push   %ebx
  102e55:	66 bb 10 00          	mov    $0x10,%bx
  102e59:	8e db                	mov    %ebx,%ds
  102e5b:	5b                   	pop    %ebx
  102e5c:	6a 00                	push   $0x0
  102e5e:	68 89 00 00 00       	push   $0x89
  102e63:	e8 68 d9 ff ff       	call   1007d0 <interrupt_handler>
  102e68:	83 c4 08             	add    $0x8,%esp
  102e6b:	0f a9                	pop    %gs
  102e6d:	0f a1                	pop    %fs
  102e6f:	07                   	pop    %es
  102e70:	1f                   	pop    %ds
  102e71:	61                   	popa   
  102e72:	fb                   	sti    
  102e73:	cf                   	iret   

00102e74 <int_handler138>:
  102e74:	fa                   	cli    
  102e75:	60                   	pusha  
  102e76:	1e                   	push   %ds
  102e77:	06                   	push   %es
  102e78:	0f a0                	push   %fs
  102e7a:	0f a8                	push   %gs
  102e7c:	53                   	push   %ebx
  102e7d:	66 bb 10 00          	mov    $0x10,%bx
  102e81:	8e db                	mov    %ebx,%ds
  102e83:	5b                   	pop    %ebx
  102e84:	6a 00                	push   $0x0
  102e86:	68 8a 00 00 00       	push   $0x8a
  102e8b:	e8 40 d9 ff ff       	call   1007d0 <interrupt_handler>
  102e90:	83 c4 08             	add    $0x8,%esp
  102e93:	0f a9                	pop    %gs
  102e95:	0f a1                	pop    %fs
  102e97:	07                   	pop    %es
  102e98:	1f                   	pop    %ds
  102e99:	61                   	popa   
  102e9a:	fb                   	sti    
  102e9b:	cf                   	iret   

00102e9c <int_handler139>:
  102e9c:	fa                   	cli    
  102e9d:	60                   	pusha  
  102e9e:	1e                   	push   %ds
  102e9f:	06                   	push   %es
  102ea0:	0f a0                	push   %fs
  102ea2:	0f a8                	push   %gs
  102ea4:	53                   	push   %ebx
  102ea5:	66 bb 10 00          	mov    $0x10,%bx
  102ea9:	8e db                	mov    %ebx,%ds
  102eab:	5b                   	pop    %ebx
  102eac:	6a 00                	push   $0x0
  102eae:	68 8b 00 00 00       	push   $0x8b
  102eb3:	e8 18 d9 ff ff       	call   1007d0 <interrupt_handler>
  102eb8:	83 c4 08             	add    $0x8,%esp
  102ebb:	0f a9                	pop    %gs
  102ebd:	0f a1                	pop    %fs
  102ebf:	07                   	pop    %es
  102ec0:	1f                   	pop    %ds
  102ec1:	61                   	popa   
  102ec2:	fb                   	sti    
  102ec3:	cf                   	iret   

00102ec4 <int_handler140>:
  102ec4:	fa                   	cli    
  102ec5:	60                   	pusha  
  102ec6:	1e                   	push   %ds
  102ec7:	06                   	push   %es
  102ec8:	0f a0                	push   %fs
  102eca:	0f a8                	push   %gs
  102ecc:	53                   	push   %ebx
  102ecd:	66 bb 10 00          	mov    $0x10,%bx
  102ed1:	8e db                	mov    %ebx,%ds
  102ed3:	5b                   	pop    %ebx
  102ed4:	6a 00                	push   $0x0
  102ed6:	68 8c 00 00 00       	push   $0x8c
  102edb:	e8 f0 d8 ff ff       	call   1007d0 <interrupt_handler>
  102ee0:	83 c4 08             	add    $0x8,%esp
  102ee3:	0f a9                	pop    %gs
  102ee5:	0f a1                	pop    %fs
  102ee7:	07                   	pop    %es
  102ee8:	1f                   	pop    %ds
  102ee9:	61                   	popa   
  102eea:	fb                   	sti    
  102eeb:	cf                   	iret   

00102eec <int_handler141>:
  102eec:	fa                   	cli    
  102eed:	60                   	pusha  
  102eee:	1e                   	push   %ds
  102eef:	06                   	push   %es
  102ef0:	0f a0                	push   %fs
  102ef2:	0f a8                	push   %gs
  102ef4:	53                   	push   %ebx
  102ef5:	66 bb 10 00          	mov    $0x10,%bx
  102ef9:	8e db                	mov    %ebx,%ds
  102efb:	5b                   	pop    %ebx
  102efc:	6a 00                	push   $0x0
  102efe:	68 8d 00 00 00       	push   $0x8d
  102f03:	e8 c8 d8 ff ff       	call   1007d0 <interrupt_handler>
  102f08:	83 c4 08             	add    $0x8,%esp
  102f0b:	0f a9                	pop    %gs
  102f0d:	0f a1                	pop    %fs
  102f0f:	07                   	pop    %es
  102f10:	1f                   	pop    %ds
  102f11:	61                   	popa   
  102f12:	fb                   	sti    
  102f13:	cf                   	iret   

00102f14 <int_handler142>:
  102f14:	fa                   	cli    
  102f15:	60                   	pusha  
  102f16:	1e                   	push   %ds
  102f17:	06                   	push   %es
  102f18:	0f a0                	push   %fs
  102f1a:	0f a8                	push   %gs
  102f1c:	53                   	push   %ebx
  102f1d:	66 bb 10 00          	mov    $0x10,%bx
  102f21:	8e db                	mov    %ebx,%ds
  102f23:	5b                   	pop    %ebx
  102f24:	6a 00                	push   $0x0
  102f26:	68 8e 00 00 00       	push   $0x8e
  102f2b:	e8 a0 d8 ff ff       	call   1007d0 <interrupt_handler>
  102f30:	83 c4 08             	add    $0x8,%esp
  102f33:	0f a9                	pop    %gs
  102f35:	0f a1                	pop    %fs
  102f37:	07                   	pop    %es
  102f38:	1f                   	pop    %ds
  102f39:	61                   	popa   
  102f3a:	fb                   	sti    
  102f3b:	cf                   	iret   

00102f3c <int_handler143>:
  102f3c:	fa                   	cli    
  102f3d:	60                   	pusha  
  102f3e:	1e                   	push   %ds
  102f3f:	06                   	push   %es
  102f40:	0f a0                	push   %fs
  102f42:	0f a8                	push   %gs
  102f44:	53                   	push   %ebx
  102f45:	66 bb 10 00          	mov    $0x10,%bx
  102f49:	8e db                	mov    %ebx,%ds
  102f4b:	5b                   	pop    %ebx
  102f4c:	6a 00                	push   $0x0
  102f4e:	68 8f 00 00 00       	push   $0x8f
  102f53:	e8 78 d8 ff ff       	call   1007d0 <interrupt_handler>
  102f58:	83 c4 08             	add    $0x8,%esp
  102f5b:	0f a9                	pop    %gs
  102f5d:	0f a1                	pop    %fs
  102f5f:	07                   	pop    %es
  102f60:	1f                   	pop    %ds
  102f61:	61                   	popa   
  102f62:	fb                   	sti    
  102f63:	cf                   	iret   

00102f64 <int_handler144>:
  102f64:	fa                   	cli    
  102f65:	60                   	pusha  
  102f66:	1e                   	push   %ds
  102f67:	06                   	push   %es
  102f68:	0f a0                	push   %fs
  102f6a:	0f a8                	push   %gs
  102f6c:	53                   	push   %ebx
  102f6d:	66 bb 10 00          	mov    $0x10,%bx
  102f71:	8e db                	mov    %ebx,%ds
  102f73:	5b                   	pop    %ebx
  102f74:	6a 00                	push   $0x0
  102f76:	68 90 00 00 00       	push   $0x90
  102f7b:	e8 50 d8 ff ff       	call   1007d0 <interrupt_handler>
  102f80:	83 c4 08             	add    $0x8,%esp
  102f83:	0f a9                	pop    %gs
  102f85:	0f a1                	pop    %fs
  102f87:	07                   	pop    %es
  102f88:	1f                   	pop    %ds
  102f89:	61                   	popa   
  102f8a:	fb                   	sti    
  102f8b:	cf                   	iret   

00102f8c <int_handler145>:
  102f8c:	fa                   	cli    
  102f8d:	60                   	pusha  
  102f8e:	1e                   	push   %ds
  102f8f:	06                   	push   %es
  102f90:	0f a0                	push   %fs
  102f92:	0f a8                	push   %gs
  102f94:	53                   	push   %ebx
  102f95:	66 bb 10 00          	mov    $0x10,%bx
  102f99:	8e db                	mov    %ebx,%ds
  102f9b:	5b                   	pop    %ebx
  102f9c:	6a 00                	push   $0x0
  102f9e:	68 91 00 00 00       	push   $0x91
  102fa3:	e8 28 d8 ff ff       	call   1007d0 <interrupt_handler>
  102fa8:	83 c4 08             	add    $0x8,%esp
  102fab:	0f a9                	pop    %gs
  102fad:	0f a1                	pop    %fs
  102faf:	07                   	pop    %es
  102fb0:	1f                   	pop    %ds
  102fb1:	61                   	popa   
  102fb2:	fb                   	sti    
  102fb3:	cf                   	iret   

00102fb4 <int_handler146>:
  102fb4:	fa                   	cli    
  102fb5:	60                   	pusha  
  102fb6:	1e                   	push   %ds
  102fb7:	06                   	push   %es
  102fb8:	0f a0                	push   %fs
  102fba:	0f a8                	push   %gs
  102fbc:	53                   	push   %ebx
  102fbd:	66 bb 10 00          	mov    $0x10,%bx
  102fc1:	8e db                	mov    %ebx,%ds
  102fc3:	5b                   	pop    %ebx
  102fc4:	6a 00                	push   $0x0
  102fc6:	68 92 00 00 00       	push   $0x92
  102fcb:	e8 00 d8 ff ff       	call   1007d0 <interrupt_handler>
  102fd0:	83 c4 08             	add    $0x8,%esp
  102fd3:	0f a9                	pop    %gs
  102fd5:	0f a1                	pop    %fs
  102fd7:	07                   	pop    %es
  102fd8:	1f                   	pop    %ds
  102fd9:	61                   	popa   
  102fda:	fb                   	sti    
  102fdb:	cf                   	iret   

00102fdc <int_handler147>:
  102fdc:	fa                   	cli    
  102fdd:	60                   	pusha  
  102fde:	1e                   	push   %ds
  102fdf:	06                   	push   %es
  102fe0:	0f a0                	push   %fs
  102fe2:	0f a8                	push   %gs
  102fe4:	53                   	push   %ebx
  102fe5:	66 bb 10 00          	mov    $0x10,%bx
  102fe9:	8e db                	mov    %ebx,%ds
  102feb:	5b                   	pop    %ebx
  102fec:	6a 00                	push   $0x0
  102fee:	68 93 00 00 00       	push   $0x93
  102ff3:	e8 d8 d7 ff ff       	call   1007d0 <interrupt_handler>
  102ff8:	83 c4 08             	add    $0x8,%esp
  102ffb:	0f a9                	pop    %gs
  102ffd:	0f a1                	pop    %fs
  102fff:	07                   	pop    %es
  103000:	1f                   	pop    %ds
  103001:	61                   	popa   
  103002:	fb                   	sti    
  103003:	cf                   	iret   

00103004 <int_handler148>:
  103004:	fa                   	cli    
  103005:	60                   	pusha  
  103006:	1e                   	push   %ds
  103007:	06                   	push   %es
  103008:	0f a0                	push   %fs
  10300a:	0f a8                	push   %gs
  10300c:	53                   	push   %ebx
  10300d:	66 bb 10 00          	mov    $0x10,%bx
  103011:	8e db                	mov    %ebx,%ds
  103013:	5b                   	pop    %ebx
  103014:	6a 00                	push   $0x0
  103016:	68 94 00 00 00       	push   $0x94
  10301b:	e8 b0 d7 ff ff       	call   1007d0 <interrupt_handler>
  103020:	83 c4 08             	add    $0x8,%esp
  103023:	0f a9                	pop    %gs
  103025:	0f a1                	pop    %fs
  103027:	07                   	pop    %es
  103028:	1f                   	pop    %ds
  103029:	61                   	popa   
  10302a:	fb                   	sti    
  10302b:	cf                   	iret   

0010302c <int_handler149>:
  10302c:	fa                   	cli    
  10302d:	60                   	pusha  
  10302e:	1e                   	push   %ds
  10302f:	06                   	push   %es
  103030:	0f a0                	push   %fs
  103032:	0f a8                	push   %gs
  103034:	53                   	push   %ebx
  103035:	66 bb 10 00          	mov    $0x10,%bx
  103039:	8e db                	mov    %ebx,%ds
  10303b:	5b                   	pop    %ebx
  10303c:	6a 00                	push   $0x0
  10303e:	68 95 00 00 00       	push   $0x95
  103043:	e8 88 d7 ff ff       	call   1007d0 <interrupt_handler>
  103048:	83 c4 08             	add    $0x8,%esp
  10304b:	0f a9                	pop    %gs
  10304d:	0f a1                	pop    %fs
  10304f:	07                   	pop    %es
  103050:	1f                   	pop    %ds
  103051:	61                   	popa   
  103052:	fb                   	sti    
  103053:	cf                   	iret   

00103054 <int_handler150>:
  103054:	fa                   	cli    
  103055:	60                   	pusha  
  103056:	1e                   	push   %ds
  103057:	06                   	push   %es
  103058:	0f a0                	push   %fs
  10305a:	0f a8                	push   %gs
  10305c:	53                   	push   %ebx
  10305d:	66 bb 10 00          	mov    $0x10,%bx
  103061:	8e db                	mov    %ebx,%ds
  103063:	5b                   	pop    %ebx
  103064:	6a 00                	push   $0x0
  103066:	68 96 00 00 00       	push   $0x96
  10306b:	e8 60 d7 ff ff       	call   1007d0 <interrupt_handler>
  103070:	83 c4 08             	add    $0x8,%esp
  103073:	0f a9                	pop    %gs
  103075:	0f a1                	pop    %fs
  103077:	07                   	pop    %es
  103078:	1f                   	pop    %ds
  103079:	61                   	popa   
  10307a:	fb                   	sti    
  10307b:	cf                   	iret   

0010307c <int_handler151>:
  10307c:	fa                   	cli    
  10307d:	60                   	pusha  
  10307e:	1e                   	push   %ds
  10307f:	06                   	push   %es
  103080:	0f a0                	push   %fs
  103082:	0f a8                	push   %gs
  103084:	53                   	push   %ebx
  103085:	66 bb 10 00          	mov    $0x10,%bx
  103089:	8e db                	mov    %ebx,%ds
  10308b:	5b                   	pop    %ebx
  10308c:	6a 00                	push   $0x0
  10308e:	68 97 00 00 00       	push   $0x97
  103093:	e8 38 d7 ff ff       	call   1007d0 <interrupt_handler>
  103098:	83 c4 08             	add    $0x8,%esp
  10309b:	0f a9                	pop    %gs
  10309d:	0f a1                	pop    %fs
  10309f:	07                   	pop    %es
  1030a0:	1f                   	pop    %ds
  1030a1:	61                   	popa   
  1030a2:	fb                   	sti    
  1030a3:	cf                   	iret   

001030a4 <int_handler152>:
  1030a4:	fa                   	cli    
  1030a5:	60                   	pusha  
  1030a6:	1e                   	push   %ds
  1030a7:	06                   	push   %es
  1030a8:	0f a0                	push   %fs
  1030aa:	0f a8                	push   %gs
  1030ac:	53                   	push   %ebx
  1030ad:	66 bb 10 00          	mov    $0x10,%bx
  1030b1:	8e db                	mov    %ebx,%ds
  1030b3:	5b                   	pop    %ebx
  1030b4:	6a 00                	push   $0x0
  1030b6:	68 98 00 00 00       	push   $0x98
  1030bb:	e8 10 d7 ff ff       	call   1007d0 <interrupt_handler>
  1030c0:	83 c4 08             	add    $0x8,%esp
  1030c3:	0f a9                	pop    %gs
  1030c5:	0f a1                	pop    %fs
  1030c7:	07                   	pop    %es
  1030c8:	1f                   	pop    %ds
  1030c9:	61                   	popa   
  1030ca:	fb                   	sti    
  1030cb:	cf                   	iret   

001030cc <int_handler153>:
  1030cc:	fa                   	cli    
  1030cd:	60                   	pusha  
  1030ce:	1e                   	push   %ds
  1030cf:	06                   	push   %es
  1030d0:	0f a0                	push   %fs
  1030d2:	0f a8                	push   %gs
  1030d4:	53                   	push   %ebx
  1030d5:	66 bb 10 00          	mov    $0x10,%bx
  1030d9:	8e db                	mov    %ebx,%ds
  1030db:	5b                   	pop    %ebx
  1030dc:	6a 00                	push   $0x0
  1030de:	68 99 00 00 00       	push   $0x99
  1030e3:	e8 e8 d6 ff ff       	call   1007d0 <interrupt_handler>
  1030e8:	83 c4 08             	add    $0x8,%esp
  1030eb:	0f a9                	pop    %gs
  1030ed:	0f a1                	pop    %fs
  1030ef:	07                   	pop    %es
  1030f0:	1f                   	pop    %ds
  1030f1:	61                   	popa   
  1030f2:	fb                   	sti    
  1030f3:	cf                   	iret   

001030f4 <int_handler154>:
  1030f4:	fa                   	cli    
  1030f5:	60                   	pusha  
  1030f6:	1e                   	push   %ds
  1030f7:	06                   	push   %es
  1030f8:	0f a0                	push   %fs
  1030fa:	0f a8                	push   %gs
  1030fc:	53                   	push   %ebx
  1030fd:	66 bb 10 00          	mov    $0x10,%bx
  103101:	8e db                	mov    %ebx,%ds
  103103:	5b                   	pop    %ebx
  103104:	6a 00                	push   $0x0
  103106:	68 9a 00 00 00       	push   $0x9a
  10310b:	e8 c0 d6 ff ff       	call   1007d0 <interrupt_handler>
  103110:	83 c4 08             	add    $0x8,%esp
  103113:	0f a9                	pop    %gs
  103115:	0f a1                	pop    %fs
  103117:	07                   	pop    %es
  103118:	1f                   	pop    %ds
  103119:	61                   	popa   
  10311a:	fb                   	sti    
  10311b:	cf                   	iret   

0010311c <int_handler155>:
  10311c:	fa                   	cli    
  10311d:	60                   	pusha  
  10311e:	1e                   	push   %ds
  10311f:	06                   	push   %es
  103120:	0f a0                	push   %fs
  103122:	0f a8                	push   %gs
  103124:	53                   	push   %ebx
  103125:	66 bb 10 00          	mov    $0x10,%bx
  103129:	8e db                	mov    %ebx,%ds
  10312b:	5b                   	pop    %ebx
  10312c:	6a 00                	push   $0x0
  10312e:	68 9b 00 00 00       	push   $0x9b
  103133:	e8 98 d6 ff ff       	call   1007d0 <interrupt_handler>
  103138:	83 c4 08             	add    $0x8,%esp
  10313b:	0f a9                	pop    %gs
  10313d:	0f a1                	pop    %fs
  10313f:	07                   	pop    %es
  103140:	1f                   	pop    %ds
  103141:	61                   	popa   
  103142:	fb                   	sti    
  103143:	cf                   	iret   

00103144 <int_handler156>:
  103144:	fa                   	cli    
  103145:	60                   	pusha  
  103146:	1e                   	push   %ds
  103147:	06                   	push   %es
  103148:	0f a0                	push   %fs
  10314a:	0f a8                	push   %gs
  10314c:	53                   	push   %ebx
  10314d:	66 bb 10 00          	mov    $0x10,%bx
  103151:	8e db                	mov    %ebx,%ds
  103153:	5b                   	pop    %ebx
  103154:	6a 00                	push   $0x0
  103156:	68 9c 00 00 00       	push   $0x9c
  10315b:	e8 70 d6 ff ff       	call   1007d0 <interrupt_handler>
  103160:	83 c4 08             	add    $0x8,%esp
  103163:	0f a9                	pop    %gs
  103165:	0f a1                	pop    %fs
  103167:	07                   	pop    %es
  103168:	1f                   	pop    %ds
  103169:	61                   	popa   
  10316a:	fb                   	sti    
  10316b:	cf                   	iret   

0010316c <int_handler157>:
  10316c:	fa                   	cli    
  10316d:	60                   	pusha  
  10316e:	1e                   	push   %ds
  10316f:	06                   	push   %es
  103170:	0f a0                	push   %fs
  103172:	0f a8                	push   %gs
  103174:	53                   	push   %ebx
  103175:	66 bb 10 00          	mov    $0x10,%bx
  103179:	8e db                	mov    %ebx,%ds
  10317b:	5b                   	pop    %ebx
  10317c:	6a 00                	push   $0x0
  10317e:	68 9d 00 00 00       	push   $0x9d
  103183:	e8 48 d6 ff ff       	call   1007d0 <interrupt_handler>
  103188:	83 c4 08             	add    $0x8,%esp
  10318b:	0f a9                	pop    %gs
  10318d:	0f a1                	pop    %fs
  10318f:	07                   	pop    %es
  103190:	1f                   	pop    %ds
  103191:	61                   	popa   
  103192:	fb                   	sti    
  103193:	cf                   	iret   

00103194 <int_handler158>:
  103194:	fa                   	cli    
  103195:	60                   	pusha  
  103196:	1e                   	push   %ds
  103197:	06                   	push   %es
  103198:	0f a0                	push   %fs
  10319a:	0f a8                	push   %gs
  10319c:	53                   	push   %ebx
  10319d:	66 bb 10 00          	mov    $0x10,%bx
  1031a1:	8e db                	mov    %ebx,%ds
  1031a3:	5b                   	pop    %ebx
  1031a4:	6a 00                	push   $0x0
  1031a6:	68 9e 00 00 00       	push   $0x9e
  1031ab:	e8 20 d6 ff ff       	call   1007d0 <interrupt_handler>
  1031b0:	83 c4 08             	add    $0x8,%esp
  1031b3:	0f a9                	pop    %gs
  1031b5:	0f a1                	pop    %fs
  1031b7:	07                   	pop    %es
  1031b8:	1f                   	pop    %ds
  1031b9:	61                   	popa   
  1031ba:	fb                   	sti    
  1031bb:	cf                   	iret   

001031bc <int_handler159>:
  1031bc:	fa                   	cli    
  1031bd:	60                   	pusha  
  1031be:	1e                   	push   %ds
  1031bf:	06                   	push   %es
  1031c0:	0f a0                	push   %fs
  1031c2:	0f a8                	push   %gs
  1031c4:	53                   	push   %ebx
  1031c5:	66 bb 10 00          	mov    $0x10,%bx
  1031c9:	8e db                	mov    %ebx,%ds
  1031cb:	5b                   	pop    %ebx
  1031cc:	6a 00                	push   $0x0
  1031ce:	68 9f 00 00 00       	push   $0x9f
  1031d3:	e8 f8 d5 ff ff       	call   1007d0 <interrupt_handler>
  1031d8:	83 c4 08             	add    $0x8,%esp
  1031db:	0f a9                	pop    %gs
  1031dd:	0f a1                	pop    %fs
  1031df:	07                   	pop    %es
  1031e0:	1f                   	pop    %ds
  1031e1:	61                   	popa   
  1031e2:	fb                   	sti    
  1031e3:	cf                   	iret   

001031e4 <int_handler160>:
  1031e4:	fa                   	cli    
  1031e5:	60                   	pusha  
  1031e6:	1e                   	push   %ds
  1031e7:	06                   	push   %es
  1031e8:	0f a0                	push   %fs
  1031ea:	0f a8                	push   %gs
  1031ec:	53                   	push   %ebx
  1031ed:	66 bb 10 00          	mov    $0x10,%bx
  1031f1:	8e db                	mov    %ebx,%ds
  1031f3:	5b                   	pop    %ebx
  1031f4:	6a 00                	push   $0x0
  1031f6:	68 a0 00 00 00       	push   $0xa0
  1031fb:	e8 d0 d5 ff ff       	call   1007d0 <interrupt_handler>
  103200:	83 c4 08             	add    $0x8,%esp
  103203:	0f a9                	pop    %gs
  103205:	0f a1                	pop    %fs
  103207:	07                   	pop    %es
  103208:	1f                   	pop    %ds
  103209:	61                   	popa   
  10320a:	fb                   	sti    
  10320b:	cf                   	iret   

0010320c <int_handler161>:
  10320c:	fa                   	cli    
  10320d:	60                   	pusha  
  10320e:	1e                   	push   %ds
  10320f:	06                   	push   %es
  103210:	0f a0                	push   %fs
  103212:	0f a8                	push   %gs
  103214:	53                   	push   %ebx
  103215:	66 bb 10 00          	mov    $0x10,%bx
  103219:	8e db                	mov    %ebx,%ds
  10321b:	5b                   	pop    %ebx
  10321c:	6a 00                	push   $0x0
  10321e:	68 a1 00 00 00       	push   $0xa1
  103223:	e8 a8 d5 ff ff       	call   1007d0 <interrupt_handler>
  103228:	83 c4 08             	add    $0x8,%esp
  10322b:	0f a9                	pop    %gs
  10322d:	0f a1                	pop    %fs
  10322f:	07                   	pop    %es
  103230:	1f                   	pop    %ds
  103231:	61                   	popa   
  103232:	fb                   	sti    
  103233:	cf                   	iret   

00103234 <int_handler162>:
  103234:	fa                   	cli    
  103235:	60                   	pusha  
  103236:	1e                   	push   %ds
  103237:	06                   	push   %es
  103238:	0f a0                	push   %fs
  10323a:	0f a8                	push   %gs
  10323c:	53                   	push   %ebx
  10323d:	66 bb 10 00          	mov    $0x10,%bx
  103241:	8e db                	mov    %ebx,%ds
  103243:	5b                   	pop    %ebx
  103244:	6a 00                	push   $0x0
  103246:	68 a2 00 00 00       	push   $0xa2
  10324b:	e8 80 d5 ff ff       	call   1007d0 <interrupt_handler>
  103250:	83 c4 08             	add    $0x8,%esp
  103253:	0f a9                	pop    %gs
  103255:	0f a1                	pop    %fs
  103257:	07                   	pop    %es
  103258:	1f                   	pop    %ds
  103259:	61                   	popa   
  10325a:	fb                   	sti    
  10325b:	cf                   	iret   

0010325c <int_handler163>:
  10325c:	fa                   	cli    
  10325d:	60                   	pusha  
  10325e:	1e                   	push   %ds
  10325f:	06                   	push   %es
  103260:	0f a0                	push   %fs
  103262:	0f a8                	push   %gs
  103264:	53                   	push   %ebx
  103265:	66 bb 10 00          	mov    $0x10,%bx
  103269:	8e db                	mov    %ebx,%ds
  10326b:	5b                   	pop    %ebx
  10326c:	6a 00                	push   $0x0
  10326e:	68 a3 00 00 00       	push   $0xa3
  103273:	e8 58 d5 ff ff       	call   1007d0 <interrupt_handler>
  103278:	83 c4 08             	add    $0x8,%esp
  10327b:	0f a9                	pop    %gs
  10327d:	0f a1                	pop    %fs
  10327f:	07                   	pop    %es
  103280:	1f                   	pop    %ds
  103281:	61                   	popa   
  103282:	fb                   	sti    
  103283:	cf                   	iret   

00103284 <int_handler164>:
  103284:	fa                   	cli    
  103285:	60                   	pusha  
  103286:	1e                   	push   %ds
  103287:	06                   	push   %es
  103288:	0f a0                	push   %fs
  10328a:	0f a8                	push   %gs
  10328c:	53                   	push   %ebx
  10328d:	66 bb 10 00          	mov    $0x10,%bx
  103291:	8e db                	mov    %ebx,%ds
  103293:	5b                   	pop    %ebx
  103294:	6a 00                	push   $0x0
  103296:	68 a4 00 00 00       	push   $0xa4
  10329b:	e8 30 d5 ff ff       	call   1007d0 <interrupt_handler>
  1032a0:	83 c4 08             	add    $0x8,%esp
  1032a3:	0f a9                	pop    %gs
  1032a5:	0f a1                	pop    %fs
  1032a7:	07                   	pop    %es
  1032a8:	1f                   	pop    %ds
  1032a9:	61                   	popa   
  1032aa:	fb                   	sti    
  1032ab:	cf                   	iret   

001032ac <int_handler165>:
  1032ac:	fa                   	cli    
  1032ad:	60                   	pusha  
  1032ae:	1e                   	push   %ds
  1032af:	06                   	push   %es
  1032b0:	0f a0                	push   %fs
  1032b2:	0f a8                	push   %gs
  1032b4:	53                   	push   %ebx
  1032b5:	66 bb 10 00          	mov    $0x10,%bx
  1032b9:	8e db                	mov    %ebx,%ds
  1032bb:	5b                   	pop    %ebx
  1032bc:	6a 00                	push   $0x0
  1032be:	68 a5 00 00 00       	push   $0xa5
  1032c3:	e8 08 d5 ff ff       	call   1007d0 <interrupt_handler>
  1032c8:	83 c4 08             	add    $0x8,%esp
  1032cb:	0f a9                	pop    %gs
  1032cd:	0f a1                	pop    %fs
  1032cf:	07                   	pop    %es
  1032d0:	1f                   	pop    %ds
  1032d1:	61                   	popa   
  1032d2:	fb                   	sti    
  1032d3:	cf                   	iret   

001032d4 <int_handler166>:
  1032d4:	fa                   	cli    
  1032d5:	60                   	pusha  
  1032d6:	1e                   	push   %ds
  1032d7:	06                   	push   %es
  1032d8:	0f a0                	push   %fs
  1032da:	0f a8                	push   %gs
  1032dc:	53                   	push   %ebx
  1032dd:	66 bb 10 00          	mov    $0x10,%bx
  1032e1:	8e db                	mov    %ebx,%ds
  1032e3:	5b                   	pop    %ebx
  1032e4:	6a 00                	push   $0x0
  1032e6:	68 a6 00 00 00       	push   $0xa6
  1032eb:	e8 e0 d4 ff ff       	call   1007d0 <interrupt_handler>
  1032f0:	83 c4 08             	add    $0x8,%esp
  1032f3:	0f a9                	pop    %gs
  1032f5:	0f a1                	pop    %fs
  1032f7:	07                   	pop    %es
  1032f8:	1f                   	pop    %ds
  1032f9:	61                   	popa   
  1032fa:	fb                   	sti    
  1032fb:	cf                   	iret   

001032fc <int_handler167>:
  1032fc:	fa                   	cli    
  1032fd:	60                   	pusha  
  1032fe:	1e                   	push   %ds
  1032ff:	06                   	push   %es
  103300:	0f a0                	push   %fs
  103302:	0f a8                	push   %gs
  103304:	53                   	push   %ebx
  103305:	66 bb 10 00          	mov    $0x10,%bx
  103309:	8e db                	mov    %ebx,%ds
  10330b:	5b                   	pop    %ebx
  10330c:	6a 00                	push   $0x0
  10330e:	68 a7 00 00 00       	push   $0xa7
  103313:	e8 b8 d4 ff ff       	call   1007d0 <interrupt_handler>
  103318:	83 c4 08             	add    $0x8,%esp
  10331b:	0f a9                	pop    %gs
  10331d:	0f a1                	pop    %fs
  10331f:	07                   	pop    %es
  103320:	1f                   	pop    %ds
  103321:	61                   	popa   
  103322:	fb                   	sti    
  103323:	cf                   	iret   

00103324 <int_handler168>:
  103324:	fa                   	cli    
  103325:	60                   	pusha  
  103326:	1e                   	push   %ds
  103327:	06                   	push   %es
  103328:	0f a0                	push   %fs
  10332a:	0f a8                	push   %gs
  10332c:	53                   	push   %ebx
  10332d:	66 bb 10 00          	mov    $0x10,%bx
  103331:	8e db                	mov    %ebx,%ds
  103333:	5b                   	pop    %ebx
  103334:	6a 00                	push   $0x0
  103336:	68 a8 00 00 00       	push   $0xa8
  10333b:	e8 90 d4 ff ff       	call   1007d0 <interrupt_handler>
  103340:	83 c4 08             	add    $0x8,%esp
  103343:	0f a9                	pop    %gs
  103345:	0f a1                	pop    %fs
  103347:	07                   	pop    %es
  103348:	1f                   	pop    %ds
  103349:	61                   	popa   
  10334a:	fb                   	sti    
  10334b:	cf                   	iret   

0010334c <int_handler169>:
  10334c:	fa                   	cli    
  10334d:	60                   	pusha  
  10334e:	1e                   	push   %ds
  10334f:	06                   	push   %es
  103350:	0f a0                	push   %fs
  103352:	0f a8                	push   %gs
  103354:	53                   	push   %ebx
  103355:	66 bb 10 00          	mov    $0x10,%bx
  103359:	8e db                	mov    %ebx,%ds
  10335b:	5b                   	pop    %ebx
  10335c:	6a 00                	push   $0x0
  10335e:	68 a9 00 00 00       	push   $0xa9
  103363:	e8 68 d4 ff ff       	call   1007d0 <interrupt_handler>
  103368:	83 c4 08             	add    $0x8,%esp
  10336b:	0f a9                	pop    %gs
  10336d:	0f a1                	pop    %fs
  10336f:	07                   	pop    %es
  103370:	1f                   	pop    %ds
  103371:	61                   	popa   
  103372:	fb                   	sti    
  103373:	cf                   	iret   

00103374 <int_handler170>:
  103374:	fa                   	cli    
  103375:	60                   	pusha  
  103376:	1e                   	push   %ds
  103377:	06                   	push   %es
  103378:	0f a0                	push   %fs
  10337a:	0f a8                	push   %gs
  10337c:	53                   	push   %ebx
  10337d:	66 bb 10 00          	mov    $0x10,%bx
  103381:	8e db                	mov    %ebx,%ds
  103383:	5b                   	pop    %ebx
  103384:	6a 00                	push   $0x0
  103386:	68 aa 00 00 00       	push   $0xaa
  10338b:	e8 40 d4 ff ff       	call   1007d0 <interrupt_handler>
  103390:	83 c4 08             	add    $0x8,%esp
  103393:	0f a9                	pop    %gs
  103395:	0f a1                	pop    %fs
  103397:	07                   	pop    %es
  103398:	1f                   	pop    %ds
  103399:	61                   	popa   
  10339a:	fb                   	sti    
  10339b:	cf                   	iret   

0010339c <int_handler171>:
  10339c:	fa                   	cli    
  10339d:	60                   	pusha  
  10339e:	1e                   	push   %ds
  10339f:	06                   	push   %es
  1033a0:	0f a0                	push   %fs
  1033a2:	0f a8                	push   %gs
  1033a4:	53                   	push   %ebx
  1033a5:	66 bb 10 00          	mov    $0x10,%bx
  1033a9:	8e db                	mov    %ebx,%ds
  1033ab:	5b                   	pop    %ebx
  1033ac:	6a 00                	push   $0x0
  1033ae:	68 ab 00 00 00       	push   $0xab
  1033b3:	e8 18 d4 ff ff       	call   1007d0 <interrupt_handler>
  1033b8:	83 c4 08             	add    $0x8,%esp
  1033bb:	0f a9                	pop    %gs
  1033bd:	0f a1                	pop    %fs
  1033bf:	07                   	pop    %es
  1033c0:	1f                   	pop    %ds
  1033c1:	61                   	popa   
  1033c2:	fb                   	sti    
  1033c3:	cf                   	iret   

001033c4 <int_handler172>:
  1033c4:	fa                   	cli    
  1033c5:	60                   	pusha  
  1033c6:	1e                   	push   %ds
  1033c7:	06                   	push   %es
  1033c8:	0f a0                	push   %fs
  1033ca:	0f a8                	push   %gs
  1033cc:	53                   	push   %ebx
  1033cd:	66 bb 10 00          	mov    $0x10,%bx
  1033d1:	8e db                	mov    %ebx,%ds
  1033d3:	5b                   	pop    %ebx
  1033d4:	6a 00                	push   $0x0
  1033d6:	68 ac 00 00 00       	push   $0xac
  1033db:	e8 f0 d3 ff ff       	call   1007d0 <interrupt_handler>
  1033e0:	83 c4 08             	add    $0x8,%esp
  1033e3:	0f a9                	pop    %gs
  1033e5:	0f a1                	pop    %fs
  1033e7:	07                   	pop    %es
  1033e8:	1f                   	pop    %ds
  1033e9:	61                   	popa   
  1033ea:	fb                   	sti    
  1033eb:	cf                   	iret   

001033ec <int_handler173>:
  1033ec:	fa                   	cli    
  1033ed:	60                   	pusha  
  1033ee:	1e                   	push   %ds
  1033ef:	06                   	push   %es
  1033f0:	0f a0                	push   %fs
  1033f2:	0f a8                	push   %gs
  1033f4:	53                   	push   %ebx
  1033f5:	66 bb 10 00          	mov    $0x10,%bx
  1033f9:	8e db                	mov    %ebx,%ds
  1033fb:	5b                   	pop    %ebx
  1033fc:	6a 00                	push   $0x0
  1033fe:	68 ad 00 00 00       	push   $0xad
  103403:	e8 c8 d3 ff ff       	call   1007d0 <interrupt_handler>
  103408:	83 c4 08             	add    $0x8,%esp
  10340b:	0f a9                	pop    %gs
  10340d:	0f a1                	pop    %fs
  10340f:	07                   	pop    %es
  103410:	1f                   	pop    %ds
  103411:	61                   	popa   
  103412:	fb                   	sti    
  103413:	cf                   	iret   

00103414 <int_handler174>:
  103414:	fa                   	cli    
  103415:	60                   	pusha  
  103416:	1e                   	push   %ds
  103417:	06                   	push   %es
  103418:	0f a0                	push   %fs
  10341a:	0f a8                	push   %gs
  10341c:	53                   	push   %ebx
  10341d:	66 bb 10 00          	mov    $0x10,%bx
  103421:	8e db                	mov    %ebx,%ds
  103423:	5b                   	pop    %ebx
  103424:	6a 00                	push   $0x0
  103426:	68 ae 00 00 00       	push   $0xae
  10342b:	e8 a0 d3 ff ff       	call   1007d0 <interrupt_handler>
  103430:	83 c4 08             	add    $0x8,%esp
  103433:	0f a9                	pop    %gs
  103435:	0f a1                	pop    %fs
  103437:	07                   	pop    %es
  103438:	1f                   	pop    %ds
  103439:	61                   	popa   
  10343a:	fb                   	sti    
  10343b:	cf                   	iret   

0010343c <int_handler175>:
  10343c:	fa                   	cli    
  10343d:	60                   	pusha  
  10343e:	1e                   	push   %ds
  10343f:	06                   	push   %es
  103440:	0f a0                	push   %fs
  103442:	0f a8                	push   %gs
  103444:	53                   	push   %ebx
  103445:	66 bb 10 00          	mov    $0x10,%bx
  103449:	8e db                	mov    %ebx,%ds
  10344b:	5b                   	pop    %ebx
  10344c:	6a 00                	push   $0x0
  10344e:	68 af 00 00 00       	push   $0xaf
  103453:	e8 78 d3 ff ff       	call   1007d0 <interrupt_handler>
  103458:	83 c4 08             	add    $0x8,%esp
  10345b:	0f a9                	pop    %gs
  10345d:	0f a1                	pop    %fs
  10345f:	07                   	pop    %es
  103460:	1f                   	pop    %ds
  103461:	61                   	popa   
  103462:	fb                   	sti    
  103463:	cf                   	iret   

00103464 <int_handler176>:
  103464:	fa                   	cli    
  103465:	60                   	pusha  
  103466:	1e                   	push   %ds
  103467:	06                   	push   %es
  103468:	0f a0                	push   %fs
  10346a:	0f a8                	push   %gs
  10346c:	53                   	push   %ebx
  10346d:	66 bb 10 00          	mov    $0x10,%bx
  103471:	8e db                	mov    %ebx,%ds
  103473:	5b                   	pop    %ebx
  103474:	6a 00                	push   $0x0
  103476:	68 b0 00 00 00       	push   $0xb0
  10347b:	e8 50 d3 ff ff       	call   1007d0 <interrupt_handler>
  103480:	83 c4 08             	add    $0x8,%esp
  103483:	0f a9                	pop    %gs
  103485:	0f a1                	pop    %fs
  103487:	07                   	pop    %es
  103488:	1f                   	pop    %ds
  103489:	61                   	popa   
  10348a:	fb                   	sti    
  10348b:	cf                   	iret   

0010348c <int_handler177>:
  10348c:	fa                   	cli    
  10348d:	60                   	pusha  
  10348e:	1e                   	push   %ds
  10348f:	06                   	push   %es
  103490:	0f a0                	push   %fs
  103492:	0f a8                	push   %gs
  103494:	53                   	push   %ebx
  103495:	66 bb 10 00          	mov    $0x10,%bx
  103499:	8e db                	mov    %ebx,%ds
  10349b:	5b                   	pop    %ebx
  10349c:	6a 00                	push   $0x0
  10349e:	68 b1 00 00 00       	push   $0xb1
  1034a3:	e8 28 d3 ff ff       	call   1007d0 <interrupt_handler>
  1034a8:	83 c4 08             	add    $0x8,%esp
  1034ab:	0f a9                	pop    %gs
  1034ad:	0f a1                	pop    %fs
  1034af:	07                   	pop    %es
  1034b0:	1f                   	pop    %ds
  1034b1:	61                   	popa   
  1034b2:	fb                   	sti    
  1034b3:	cf                   	iret   

001034b4 <int_handler178>:
  1034b4:	fa                   	cli    
  1034b5:	60                   	pusha  
  1034b6:	1e                   	push   %ds
  1034b7:	06                   	push   %es
  1034b8:	0f a0                	push   %fs
  1034ba:	0f a8                	push   %gs
  1034bc:	53                   	push   %ebx
  1034bd:	66 bb 10 00          	mov    $0x10,%bx
  1034c1:	8e db                	mov    %ebx,%ds
  1034c3:	5b                   	pop    %ebx
  1034c4:	6a 00                	push   $0x0
  1034c6:	68 b2 00 00 00       	push   $0xb2
  1034cb:	e8 00 d3 ff ff       	call   1007d0 <interrupt_handler>
  1034d0:	83 c4 08             	add    $0x8,%esp
  1034d3:	0f a9                	pop    %gs
  1034d5:	0f a1                	pop    %fs
  1034d7:	07                   	pop    %es
  1034d8:	1f                   	pop    %ds
  1034d9:	61                   	popa   
  1034da:	fb                   	sti    
  1034db:	cf                   	iret   

001034dc <int_handler179>:
  1034dc:	fa                   	cli    
  1034dd:	60                   	pusha  
  1034de:	1e                   	push   %ds
  1034df:	06                   	push   %es
  1034e0:	0f a0                	push   %fs
  1034e2:	0f a8                	push   %gs
  1034e4:	53                   	push   %ebx
  1034e5:	66 bb 10 00          	mov    $0x10,%bx
  1034e9:	8e db                	mov    %ebx,%ds
  1034eb:	5b                   	pop    %ebx
  1034ec:	6a 00                	push   $0x0
  1034ee:	68 b3 00 00 00       	push   $0xb3
  1034f3:	e8 d8 d2 ff ff       	call   1007d0 <interrupt_handler>
  1034f8:	83 c4 08             	add    $0x8,%esp
  1034fb:	0f a9                	pop    %gs
  1034fd:	0f a1                	pop    %fs
  1034ff:	07                   	pop    %es
  103500:	1f                   	pop    %ds
  103501:	61                   	popa   
  103502:	fb                   	sti    
  103503:	cf                   	iret   

00103504 <int_handler180>:
  103504:	fa                   	cli    
  103505:	60                   	pusha  
  103506:	1e                   	push   %ds
  103507:	06                   	push   %es
  103508:	0f a0                	push   %fs
  10350a:	0f a8                	push   %gs
  10350c:	53                   	push   %ebx
  10350d:	66 bb 10 00          	mov    $0x10,%bx
  103511:	8e db                	mov    %ebx,%ds
  103513:	5b                   	pop    %ebx
  103514:	6a 00                	push   $0x0
  103516:	68 b4 00 00 00       	push   $0xb4
  10351b:	e8 b0 d2 ff ff       	call   1007d0 <interrupt_handler>
  103520:	83 c4 08             	add    $0x8,%esp
  103523:	0f a9                	pop    %gs
  103525:	0f a1                	pop    %fs
  103527:	07                   	pop    %es
  103528:	1f                   	pop    %ds
  103529:	61                   	popa   
  10352a:	fb                   	sti    
  10352b:	cf                   	iret   

0010352c <int_handler181>:
  10352c:	fa                   	cli    
  10352d:	60                   	pusha  
  10352e:	1e                   	push   %ds
  10352f:	06                   	push   %es
  103530:	0f a0                	push   %fs
  103532:	0f a8                	push   %gs
  103534:	53                   	push   %ebx
  103535:	66 bb 10 00          	mov    $0x10,%bx
  103539:	8e db                	mov    %ebx,%ds
  10353b:	5b                   	pop    %ebx
  10353c:	6a 00                	push   $0x0
  10353e:	68 b5 00 00 00       	push   $0xb5
  103543:	e8 88 d2 ff ff       	call   1007d0 <interrupt_handler>
  103548:	83 c4 08             	add    $0x8,%esp
  10354b:	0f a9                	pop    %gs
  10354d:	0f a1                	pop    %fs
  10354f:	07                   	pop    %es
  103550:	1f                   	pop    %ds
  103551:	61                   	popa   
  103552:	fb                   	sti    
  103553:	cf                   	iret   

00103554 <int_handler182>:
  103554:	fa                   	cli    
  103555:	60                   	pusha  
  103556:	1e                   	push   %ds
  103557:	06                   	push   %es
  103558:	0f a0                	push   %fs
  10355a:	0f a8                	push   %gs
  10355c:	53                   	push   %ebx
  10355d:	66 bb 10 00          	mov    $0x10,%bx
  103561:	8e db                	mov    %ebx,%ds
  103563:	5b                   	pop    %ebx
  103564:	6a 00                	push   $0x0
  103566:	68 b6 00 00 00       	push   $0xb6
  10356b:	e8 60 d2 ff ff       	call   1007d0 <interrupt_handler>
  103570:	83 c4 08             	add    $0x8,%esp
  103573:	0f a9                	pop    %gs
  103575:	0f a1                	pop    %fs
  103577:	07                   	pop    %es
  103578:	1f                   	pop    %ds
  103579:	61                   	popa   
  10357a:	fb                   	sti    
  10357b:	cf                   	iret   

0010357c <int_handler183>:
  10357c:	fa                   	cli    
  10357d:	60                   	pusha  
  10357e:	1e                   	push   %ds
  10357f:	06                   	push   %es
  103580:	0f a0                	push   %fs
  103582:	0f a8                	push   %gs
  103584:	53                   	push   %ebx
  103585:	66 bb 10 00          	mov    $0x10,%bx
  103589:	8e db                	mov    %ebx,%ds
  10358b:	5b                   	pop    %ebx
  10358c:	6a 00                	push   $0x0
  10358e:	68 b7 00 00 00       	push   $0xb7
  103593:	e8 38 d2 ff ff       	call   1007d0 <interrupt_handler>
  103598:	83 c4 08             	add    $0x8,%esp
  10359b:	0f a9                	pop    %gs
  10359d:	0f a1                	pop    %fs
  10359f:	07                   	pop    %es
  1035a0:	1f                   	pop    %ds
  1035a1:	61                   	popa   
  1035a2:	fb                   	sti    
  1035a3:	cf                   	iret   

001035a4 <int_handler184>:
  1035a4:	fa                   	cli    
  1035a5:	60                   	pusha  
  1035a6:	1e                   	push   %ds
  1035a7:	06                   	push   %es
  1035a8:	0f a0                	push   %fs
  1035aa:	0f a8                	push   %gs
  1035ac:	53                   	push   %ebx
  1035ad:	66 bb 10 00          	mov    $0x10,%bx
  1035b1:	8e db                	mov    %ebx,%ds
  1035b3:	5b                   	pop    %ebx
  1035b4:	6a 00                	push   $0x0
  1035b6:	68 b8 00 00 00       	push   $0xb8
  1035bb:	e8 10 d2 ff ff       	call   1007d0 <interrupt_handler>
  1035c0:	83 c4 08             	add    $0x8,%esp
  1035c3:	0f a9                	pop    %gs
  1035c5:	0f a1                	pop    %fs
  1035c7:	07                   	pop    %es
  1035c8:	1f                   	pop    %ds
  1035c9:	61                   	popa   
  1035ca:	fb                   	sti    
  1035cb:	cf                   	iret   

001035cc <int_handler185>:
  1035cc:	fa                   	cli    
  1035cd:	60                   	pusha  
  1035ce:	1e                   	push   %ds
  1035cf:	06                   	push   %es
  1035d0:	0f a0                	push   %fs
  1035d2:	0f a8                	push   %gs
  1035d4:	53                   	push   %ebx
  1035d5:	66 bb 10 00          	mov    $0x10,%bx
  1035d9:	8e db                	mov    %ebx,%ds
  1035db:	5b                   	pop    %ebx
  1035dc:	6a 00                	push   $0x0
  1035de:	68 b9 00 00 00       	push   $0xb9
  1035e3:	e8 e8 d1 ff ff       	call   1007d0 <interrupt_handler>
  1035e8:	83 c4 08             	add    $0x8,%esp
  1035eb:	0f a9                	pop    %gs
  1035ed:	0f a1                	pop    %fs
  1035ef:	07                   	pop    %es
  1035f0:	1f                   	pop    %ds
  1035f1:	61                   	popa   
  1035f2:	fb                   	sti    
  1035f3:	cf                   	iret   

001035f4 <int_handler186>:
  1035f4:	fa                   	cli    
  1035f5:	60                   	pusha  
  1035f6:	1e                   	push   %ds
  1035f7:	06                   	push   %es
  1035f8:	0f a0                	push   %fs
  1035fa:	0f a8                	push   %gs
  1035fc:	53                   	push   %ebx
  1035fd:	66 bb 10 00          	mov    $0x10,%bx
  103601:	8e db                	mov    %ebx,%ds
  103603:	5b                   	pop    %ebx
  103604:	6a 00                	push   $0x0
  103606:	68 ba 00 00 00       	push   $0xba
  10360b:	e8 c0 d1 ff ff       	call   1007d0 <interrupt_handler>
  103610:	83 c4 08             	add    $0x8,%esp
  103613:	0f a9                	pop    %gs
  103615:	0f a1                	pop    %fs
  103617:	07                   	pop    %es
  103618:	1f                   	pop    %ds
  103619:	61                   	popa   
  10361a:	fb                   	sti    
  10361b:	cf                   	iret   

0010361c <int_handler187>:
  10361c:	fa                   	cli    
  10361d:	60                   	pusha  
  10361e:	1e                   	push   %ds
  10361f:	06                   	push   %es
  103620:	0f a0                	push   %fs
  103622:	0f a8                	push   %gs
  103624:	53                   	push   %ebx
  103625:	66 bb 10 00          	mov    $0x10,%bx
  103629:	8e db                	mov    %ebx,%ds
  10362b:	5b                   	pop    %ebx
  10362c:	6a 00                	push   $0x0
  10362e:	68 bb 00 00 00       	push   $0xbb
  103633:	e8 98 d1 ff ff       	call   1007d0 <interrupt_handler>
  103638:	83 c4 08             	add    $0x8,%esp
  10363b:	0f a9                	pop    %gs
  10363d:	0f a1                	pop    %fs
  10363f:	07                   	pop    %es
  103640:	1f                   	pop    %ds
  103641:	61                   	popa   
  103642:	fb                   	sti    
  103643:	cf                   	iret   

00103644 <int_handler188>:
  103644:	fa                   	cli    
  103645:	60                   	pusha  
  103646:	1e                   	push   %ds
  103647:	06                   	push   %es
  103648:	0f a0                	push   %fs
  10364a:	0f a8                	push   %gs
  10364c:	53                   	push   %ebx
  10364d:	66 bb 10 00          	mov    $0x10,%bx
  103651:	8e db                	mov    %ebx,%ds
  103653:	5b                   	pop    %ebx
  103654:	6a 00                	push   $0x0
  103656:	68 bc 00 00 00       	push   $0xbc
  10365b:	e8 70 d1 ff ff       	call   1007d0 <interrupt_handler>
  103660:	83 c4 08             	add    $0x8,%esp
  103663:	0f a9                	pop    %gs
  103665:	0f a1                	pop    %fs
  103667:	07                   	pop    %es
  103668:	1f                   	pop    %ds
  103669:	61                   	popa   
  10366a:	fb                   	sti    
  10366b:	cf                   	iret   

0010366c <int_handler189>:
  10366c:	fa                   	cli    
  10366d:	60                   	pusha  
  10366e:	1e                   	push   %ds
  10366f:	06                   	push   %es
  103670:	0f a0                	push   %fs
  103672:	0f a8                	push   %gs
  103674:	53                   	push   %ebx
  103675:	66 bb 10 00          	mov    $0x10,%bx
  103679:	8e db                	mov    %ebx,%ds
  10367b:	5b                   	pop    %ebx
  10367c:	6a 00                	push   $0x0
  10367e:	68 bd 00 00 00       	push   $0xbd
  103683:	e8 48 d1 ff ff       	call   1007d0 <interrupt_handler>
  103688:	83 c4 08             	add    $0x8,%esp
  10368b:	0f a9                	pop    %gs
  10368d:	0f a1                	pop    %fs
  10368f:	07                   	pop    %es
  103690:	1f                   	pop    %ds
  103691:	61                   	popa   
  103692:	fb                   	sti    
  103693:	cf                   	iret   

00103694 <int_handler190>:
  103694:	fa                   	cli    
  103695:	60                   	pusha  
  103696:	1e                   	push   %ds
  103697:	06                   	push   %es
  103698:	0f a0                	push   %fs
  10369a:	0f a8                	push   %gs
  10369c:	53                   	push   %ebx
  10369d:	66 bb 10 00          	mov    $0x10,%bx
  1036a1:	8e db                	mov    %ebx,%ds
  1036a3:	5b                   	pop    %ebx
  1036a4:	6a 00                	push   $0x0
  1036a6:	68 be 00 00 00       	push   $0xbe
  1036ab:	e8 20 d1 ff ff       	call   1007d0 <interrupt_handler>
  1036b0:	83 c4 08             	add    $0x8,%esp
  1036b3:	0f a9                	pop    %gs
  1036b5:	0f a1                	pop    %fs
  1036b7:	07                   	pop    %es
  1036b8:	1f                   	pop    %ds
  1036b9:	61                   	popa   
  1036ba:	fb                   	sti    
  1036bb:	cf                   	iret   

001036bc <int_handler191>:
  1036bc:	fa                   	cli    
  1036bd:	60                   	pusha  
  1036be:	1e                   	push   %ds
  1036bf:	06                   	push   %es
  1036c0:	0f a0                	push   %fs
  1036c2:	0f a8                	push   %gs
  1036c4:	53                   	push   %ebx
  1036c5:	66 bb 10 00          	mov    $0x10,%bx
  1036c9:	8e db                	mov    %ebx,%ds
  1036cb:	5b                   	pop    %ebx
  1036cc:	6a 00                	push   $0x0
  1036ce:	68 bf 00 00 00       	push   $0xbf
  1036d3:	e8 f8 d0 ff ff       	call   1007d0 <interrupt_handler>
  1036d8:	83 c4 08             	add    $0x8,%esp
  1036db:	0f a9                	pop    %gs
  1036dd:	0f a1                	pop    %fs
  1036df:	07                   	pop    %es
  1036e0:	1f                   	pop    %ds
  1036e1:	61                   	popa   
  1036e2:	fb                   	sti    
  1036e3:	cf                   	iret   

001036e4 <int_handler192>:
  1036e4:	fa                   	cli    
  1036e5:	60                   	pusha  
  1036e6:	1e                   	push   %ds
  1036e7:	06                   	push   %es
  1036e8:	0f a0                	push   %fs
  1036ea:	0f a8                	push   %gs
  1036ec:	53                   	push   %ebx
  1036ed:	66 bb 10 00          	mov    $0x10,%bx
  1036f1:	8e db                	mov    %ebx,%ds
  1036f3:	5b                   	pop    %ebx
  1036f4:	6a 00                	push   $0x0
  1036f6:	68 c0 00 00 00       	push   $0xc0
  1036fb:	e8 d0 d0 ff ff       	call   1007d0 <interrupt_handler>
  103700:	83 c4 08             	add    $0x8,%esp
  103703:	0f a9                	pop    %gs
  103705:	0f a1                	pop    %fs
  103707:	07                   	pop    %es
  103708:	1f                   	pop    %ds
  103709:	61                   	popa   
  10370a:	fb                   	sti    
  10370b:	cf                   	iret   

0010370c <int_handler193>:
  10370c:	fa                   	cli    
  10370d:	60                   	pusha  
  10370e:	1e                   	push   %ds
  10370f:	06                   	push   %es
  103710:	0f a0                	push   %fs
  103712:	0f a8                	push   %gs
  103714:	53                   	push   %ebx
  103715:	66 bb 10 00          	mov    $0x10,%bx
  103719:	8e db                	mov    %ebx,%ds
  10371b:	5b                   	pop    %ebx
  10371c:	6a 00                	push   $0x0
  10371e:	68 c1 00 00 00       	push   $0xc1
  103723:	e8 a8 d0 ff ff       	call   1007d0 <interrupt_handler>
  103728:	83 c4 08             	add    $0x8,%esp
  10372b:	0f a9                	pop    %gs
  10372d:	0f a1                	pop    %fs
  10372f:	07                   	pop    %es
  103730:	1f                   	pop    %ds
  103731:	61                   	popa   
  103732:	fb                   	sti    
  103733:	cf                   	iret   

00103734 <int_handler194>:
  103734:	fa                   	cli    
  103735:	60                   	pusha  
  103736:	1e                   	push   %ds
  103737:	06                   	push   %es
  103738:	0f a0                	push   %fs
  10373a:	0f a8                	push   %gs
  10373c:	53                   	push   %ebx
  10373d:	66 bb 10 00          	mov    $0x10,%bx
  103741:	8e db                	mov    %ebx,%ds
  103743:	5b                   	pop    %ebx
  103744:	6a 00                	push   $0x0
  103746:	68 c2 00 00 00       	push   $0xc2
  10374b:	e8 80 d0 ff ff       	call   1007d0 <interrupt_handler>
  103750:	83 c4 08             	add    $0x8,%esp
  103753:	0f a9                	pop    %gs
  103755:	0f a1                	pop    %fs
  103757:	07                   	pop    %es
  103758:	1f                   	pop    %ds
  103759:	61                   	popa   
  10375a:	fb                   	sti    
  10375b:	cf                   	iret   

0010375c <int_handler195>:
  10375c:	fa                   	cli    
  10375d:	60                   	pusha  
  10375e:	1e                   	push   %ds
  10375f:	06                   	push   %es
  103760:	0f a0                	push   %fs
  103762:	0f a8                	push   %gs
  103764:	53                   	push   %ebx
  103765:	66 bb 10 00          	mov    $0x10,%bx
  103769:	8e db                	mov    %ebx,%ds
  10376b:	5b                   	pop    %ebx
  10376c:	6a 00                	push   $0x0
  10376e:	68 c3 00 00 00       	push   $0xc3
  103773:	e8 58 d0 ff ff       	call   1007d0 <interrupt_handler>
  103778:	83 c4 08             	add    $0x8,%esp
  10377b:	0f a9                	pop    %gs
  10377d:	0f a1                	pop    %fs
  10377f:	07                   	pop    %es
  103780:	1f                   	pop    %ds
  103781:	61                   	popa   
  103782:	fb                   	sti    
  103783:	cf                   	iret   

00103784 <int_handler196>:
  103784:	fa                   	cli    
  103785:	60                   	pusha  
  103786:	1e                   	push   %ds
  103787:	06                   	push   %es
  103788:	0f a0                	push   %fs
  10378a:	0f a8                	push   %gs
  10378c:	53                   	push   %ebx
  10378d:	66 bb 10 00          	mov    $0x10,%bx
  103791:	8e db                	mov    %ebx,%ds
  103793:	5b                   	pop    %ebx
  103794:	6a 00                	push   $0x0
  103796:	68 c4 00 00 00       	push   $0xc4
  10379b:	e8 30 d0 ff ff       	call   1007d0 <interrupt_handler>
  1037a0:	83 c4 08             	add    $0x8,%esp
  1037a3:	0f a9                	pop    %gs
  1037a5:	0f a1                	pop    %fs
  1037a7:	07                   	pop    %es
  1037a8:	1f                   	pop    %ds
  1037a9:	61                   	popa   
  1037aa:	fb                   	sti    
  1037ab:	cf                   	iret   

001037ac <int_handler197>:
  1037ac:	fa                   	cli    
  1037ad:	60                   	pusha  
  1037ae:	1e                   	push   %ds
  1037af:	06                   	push   %es
  1037b0:	0f a0                	push   %fs
  1037b2:	0f a8                	push   %gs
  1037b4:	53                   	push   %ebx
  1037b5:	66 bb 10 00          	mov    $0x10,%bx
  1037b9:	8e db                	mov    %ebx,%ds
  1037bb:	5b                   	pop    %ebx
  1037bc:	6a 00                	push   $0x0
  1037be:	68 c5 00 00 00       	push   $0xc5
  1037c3:	e8 08 d0 ff ff       	call   1007d0 <interrupt_handler>
  1037c8:	83 c4 08             	add    $0x8,%esp
  1037cb:	0f a9                	pop    %gs
  1037cd:	0f a1                	pop    %fs
  1037cf:	07                   	pop    %es
  1037d0:	1f                   	pop    %ds
  1037d1:	61                   	popa   
  1037d2:	fb                   	sti    
  1037d3:	cf                   	iret   

001037d4 <int_handler198>:
  1037d4:	fa                   	cli    
  1037d5:	60                   	pusha  
  1037d6:	1e                   	push   %ds
  1037d7:	06                   	push   %es
  1037d8:	0f a0                	push   %fs
  1037da:	0f a8                	push   %gs
  1037dc:	53                   	push   %ebx
  1037dd:	66 bb 10 00          	mov    $0x10,%bx
  1037e1:	8e db                	mov    %ebx,%ds
  1037e3:	5b                   	pop    %ebx
  1037e4:	6a 00                	push   $0x0
  1037e6:	68 c6 00 00 00       	push   $0xc6
  1037eb:	e8 e0 cf ff ff       	call   1007d0 <interrupt_handler>
  1037f0:	83 c4 08             	add    $0x8,%esp
  1037f3:	0f a9                	pop    %gs
  1037f5:	0f a1                	pop    %fs
  1037f7:	07                   	pop    %es
  1037f8:	1f                   	pop    %ds
  1037f9:	61                   	popa   
  1037fa:	fb                   	sti    
  1037fb:	cf                   	iret   

001037fc <int_handler199>:
  1037fc:	fa                   	cli    
  1037fd:	60                   	pusha  
  1037fe:	1e                   	push   %ds
  1037ff:	06                   	push   %es
  103800:	0f a0                	push   %fs
  103802:	0f a8                	push   %gs
  103804:	53                   	push   %ebx
  103805:	66 bb 10 00          	mov    $0x10,%bx
  103809:	8e db                	mov    %ebx,%ds
  10380b:	5b                   	pop    %ebx
  10380c:	6a 00                	push   $0x0
  10380e:	68 c7 00 00 00       	push   $0xc7
  103813:	e8 b8 cf ff ff       	call   1007d0 <interrupt_handler>
  103818:	83 c4 08             	add    $0x8,%esp
  10381b:	0f a9                	pop    %gs
  10381d:	0f a1                	pop    %fs
  10381f:	07                   	pop    %es
  103820:	1f                   	pop    %ds
  103821:	61                   	popa   
  103822:	fb                   	sti    
  103823:	cf                   	iret   

00103824 <int_handler200>:
  103824:	fa                   	cli    
  103825:	60                   	pusha  
  103826:	1e                   	push   %ds
  103827:	06                   	push   %es
  103828:	0f a0                	push   %fs
  10382a:	0f a8                	push   %gs
  10382c:	53                   	push   %ebx
  10382d:	66 bb 10 00          	mov    $0x10,%bx
  103831:	8e db                	mov    %ebx,%ds
  103833:	5b                   	pop    %ebx
  103834:	6a 00                	push   $0x0
  103836:	68 c8 00 00 00       	push   $0xc8
  10383b:	e8 90 cf ff ff       	call   1007d0 <interrupt_handler>
  103840:	83 c4 08             	add    $0x8,%esp
  103843:	0f a9                	pop    %gs
  103845:	0f a1                	pop    %fs
  103847:	07                   	pop    %es
  103848:	1f                   	pop    %ds
  103849:	61                   	popa   
  10384a:	fb                   	sti    
  10384b:	cf                   	iret   

0010384c <int_handler201>:
  10384c:	fa                   	cli    
  10384d:	60                   	pusha  
  10384e:	1e                   	push   %ds
  10384f:	06                   	push   %es
  103850:	0f a0                	push   %fs
  103852:	0f a8                	push   %gs
  103854:	53                   	push   %ebx
  103855:	66 bb 10 00          	mov    $0x10,%bx
  103859:	8e db                	mov    %ebx,%ds
  10385b:	5b                   	pop    %ebx
  10385c:	6a 00                	push   $0x0
  10385e:	68 c9 00 00 00       	push   $0xc9
  103863:	e8 68 cf ff ff       	call   1007d0 <interrupt_handler>
  103868:	83 c4 08             	add    $0x8,%esp
  10386b:	0f a9                	pop    %gs
  10386d:	0f a1                	pop    %fs
  10386f:	07                   	pop    %es
  103870:	1f                   	pop    %ds
  103871:	61                   	popa   
  103872:	fb                   	sti    
  103873:	cf                   	iret   

00103874 <int_handler202>:
  103874:	fa                   	cli    
  103875:	60                   	pusha  
  103876:	1e                   	push   %ds
  103877:	06                   	push   %es
  103878:	0f a0                	push   %fs
  10387a:	0f a8                	push   %gs
  10387c:	53                   	push   %ebx
  10387d:	66 bb 10 00          	mov    $0x10,%bx
  103881:	8e db                	mov    %ebx,%ds
  103883:	5b                   	pop    %ebx
  103884:	6a 00                	push   $0x0
  103886:	68 ca 00 00 00       	push   $0xca
  10388b:	e8 40 cf ff ff       	call   1007d0 <interrupt_handler>
  103890:	83 c4 08             	add    $0x8,%esp
  103893:	0f a9                	pop    %gs
  103895:	0f a1                	pop    %fs
  103897:	07                   	pop    %es
  103898:	1f                   	pop    %ds
  103899:	61                   	popa   
  10389a:	fb                   	sti    
  10389b:	cf                   	iret   

0010389c <int_handler203>:
  10389c:	fa                   	cli    
  10389d:	60                   	pusha  
  10389e:	1e                   	push   %ds
  10389f:	06                   	push   %es
  1038a0:	0f a0                	push   %fs
  1038a2:	0f a8                	push   %gs
  1038a4:	53                   	push   %ebx
  1038a5:	66 bb 10 00          	mov    $0x10,%bx
  1038a9:	8e db                	mov    %ebx,%ds
  1038ab:	5b                   	pop    %ebx
  1038ac:	6a 00                	push   $0x0
  1038ae:	68 cb 00 00 00       	push   $0xcb
  1038b3:	e8 18 cf ff ff       	call   1007d0 <interrupt_handler>
  1038b8:	83 c4 08             	add    $0x8,%esp
  1038bb:	0f a9                	pop    %gs
  1038bd:	0f a1                	pop    %fs
  1038bf:	07                   	pop    %es
  1038c0:	1f                   	pop    %ds
  1038c1:	61                   	popa   
  1038c2:	fb                   	sti    
  1038c3:	cf                   	iret   

001038c4 <int_handler204>:
  1038c4:	fa                   	cli    
  1038c5:	60                   	pusha  
  1038c6:	1e                   	push   %ds
  1038c7:	06                   	push   %es
  1038c8:	0f a0                	push   %fs
  1038ca:	0f a8                	push   %gs
  1038cc:	53                   	push   %ebx
  1038cd:	66 bb 10 00          	mov    $0x10,%bx
  1038d1:	8e db                	mov    %ebx,%ds
  1038d3:	5b                   	pop    %ebx
  1038d4:	6a 00                	push   $0x0
  1038d6:	68 cc 00 00 00       	push   $0xcc
  1038db:	e8 f0 ce ff ff       	call   1007d0 <interrupt_handler>
  1038e0:	83 c4 08             	add    $0x8,%esp
  1038e3:	0f a9                	pop    %gs
  1038e5:	0f a1                	pop    %fs
  1038e7:	07                   	pop    %es
  1038e8:	1f                   	pop    %ds
  1038e9:	61                   	popa   
  1038ea:	fb                   	sti    
  1038eb:	cf                   	iret   

001038ec <int_handler205>:
  1038ec:	fa                   	cli    
  1038ed:	60                   	pusha  
  1038ee:	1e                   	push   %ds
  1038ef:	06                   	push   %es
  1038f0:	0f a0                	push   %fs
  1038f2:	0f a8                	push   %gs
  1038f4:	53                   	push   %ebx
  1038f5:	66 bb 10 00          	mov    $0x10,%bx
  1038f9:	8e db                	mov    %ebx,%ds
  1038fb:	5b                   	pop    %ebx
  1038fc:	6a 00                	push   $0x0
  1038fe:	68 cd 00 00 00       	push   $0xcd
  103903:	e8 c8 ce ff ff       	call   1007d0 <interrupt_handler>
  103908:	83 c4 08             	add    $0x8,%esp
  10390b:	0f a9                	pop    %gs
  10390d:	0f a1                	pop    %fs
  10390f:	07                   	pop    %es
  103910:	1f                   	pop    %ds
  103911:	61                   	popa   
  103912:	fb                   	sti    
  103913:	cf                   	iret   

00103914 <int_handler206>:
  103914:	fa                   	cli    
  103915:	60                   	pusha  
  103916:	1e                   	push   %ds
  103917:	06                   	push   %es
  103918:	0f a0                	push   %fs
  10391a:	0f a8                	push   %gs
  10391c:	53                   	push   %ebx
  10391d:	66 bb 10 00          	mov    $0x10,%bx
  103921:	8e db                	mov    %ebx,%ds
  103923:	5b                   	pop    %ebx
  103924:	6a 00                	push   $0x0
  103926:	68 ce 00 00 00       	push   $0xce
  10392b:	e8 a0 ce ff ff       	call   1007d0 <interrupt_handler>
  103930:	83 c4 08             	add    $0x8,%esp
  103933:	0f a9                	pop    %gs
  103935:	0f a1                	pop    %fs
  103937:	07                   	pop    %es
  103938:	1f                   	pop    %ds
  103939:	61                   	popa   
  10393a:	fb                   	sti    
  10393b:	cf                   	iret   

0010393c <int_handler207>:
  10393c:	fa                   	cli    
  10393d:	60                   	pusha  
  10393e:	1e                   	push   %ds
  10393f:	06                   	push   %es
  103940:	0f a0                	push   %fs
  103942:	0f a8                	push   %gs
  103944:	53                   	push   %ebx
  103945:	66 bb 10 00          	mov    $0x10,%bx
  103949:	8e db                	mov    %ebx,%ds
  10394b:	5b                   	pop    %ebx
  10394c:	6a 00                	push   $0x0
  10394e:	68 cf 00 00 00       	push   $0xcf
  103953:	e8 78 ce ff ff       	call   1007d0 <interrupt_handler>
  103958:	83 c4 08             	add    $0x8,%esp
  10395b:	0f a9                	pop    %gs
  10395d:	0f a1                	pop    %fs
  10395f:	07                   	pop    %es
  103960:	1f                   	pop    %ds
  103961:	61                   	popa   
  103962:	fb                   	sti    
  103963:	cf                   	iret   

00103964 <int_handler208>:
  103964:	fa                   	cli    
  103965:	60                   	pusha  
  103966:	1e                   	push   %ds
  103967:	06                   	push   %es
  103968:	0f a0                	push   %fs
  10396a:	0f a8                	push   %gs
  10396c:	53                   	push   %ebx
  10396d:	66 bb 10 00          	mov    $0x10,%bx
  103971:	8e db                	mov    %ebx,%ds
  103973:	5b                   	pop    %ebx
  103974:	6a 00                	push   $0x0
  103976:	68 d0 00 00 00       	push   $0xd0
  10397b:	e8 50 ce ff ff       	call   1007d0 <interrupt_handler>
  103980:	83 c4 08             	add    $0x8,%esp
  103983:	0f a9                	pop    %gs
  103985:	0f a1                	pop    %fs
  103987:	07                   	pop    %es
  103988:	1f                   	pop    %ds
  103989:	61                   	popa   
  10398a:	fb                   	sti    
  10398b:	cf                   	iret   

0010398c <int_handler209>:
  10398c:	fa                   	cli    
  10398d:	60                   	pusha  
  10398e:	1e                   	push   %ds
  10398f:	06                   	push   %es
  103990:	0f a0                	push   %fs
  103992:	0f a8                	push   %gs
  103994:	53                   	push   %ebx
  103995:	66 bb 10 00          	mov    $0x10,%bx
  103999:	8e db                	mov    %ebx,%ds
  10399b:	5b                   	pop    %ebx
  10399c:	6a 00                	push   $0x0
  10399e:	68 d1 00 00 00       	push   $0xd1
  1039a3:	e8 28 ce ff ff       	call   1007d0 <interrupt_handler>
  1039a8:	83 c4 08             	add    $0x8,%esp
  1039ab:	0f a9                	pop    %gs
  1039ad:	0f a1                	pop    %fs
  1039af:	07                   	pop    %es
  1039b0:	1f                   	pop    %ds
  1039b1:	61                   	popa   
  1039b2:	fb                   	sti    
  1039b3:	cf                   	iret   

001039b4 <int_handler210>:
  1039b4:	fa                   	cli    
  1039b5:	60                   	pusha  
  1039b6:	1e                   	push   %ds
  1039b7:	06                   	push   %es
  1039b8:	0f a0                	push   %fs
  1039ba:	0f a8                	push   %gs
  1039bc:	53                   	push   %ebx
  1039bd:	66 bb 10 00          	mov    $0x10,%bx
  1039c1:	8e db                	mov    %ebx,%ds
  1039c3:	5b                   	pop    %ebx
  1039c4:	6a 00                	push   $0x0
  1039c6:	68 d2 00 00 00       	push   $0xd2
  1039cb:	e8 00 ce ff ff       	call   1007d0 <interrupt_handler>
  1039d0:	83 c4 08             	add    $0x8,%esp
  1039d3:	0f a9                	pop    %gs
  1039d5:	0f a1                	pop    %fs
  1039d7:	07                   	pop    %es
  1039d8:	1f                   	pop    %ds
  1039d9:	61                   	popa   
  1039da:	fb                   	sti    
  1039db:	cf                   	iret   

001039dc <int_handler211>:
  1039dc:	fa                   	cli    
  1039dd:	60                   	pusha  
  1039de:	1e                   	push   %ds
  1039df:	06                   	push   %es
  1039e0:	0f a0                	push   %fs
  1039e2:	0f a8                	push   %gs
  1039e4:	53                   	push   %ebx
  1039e5:	66 bb 10 00          	mov    $0x10,%bx
  1039e9:	8e db                	mov    %ebx,%ds
  1039eb:	5b                   	pop    %ebx
  1039ec:	6a 00                	push   $0x0
  1039ee:	68 d3 00 00 00       	push   $0xd3
  1039f3:	e8 d8 cd ff ff       	call   1007d0 <interrupt_handler>
  1039f8:	83 c4 08             	add    $0x8,%esp
  1039fb:	0f a9                	pop    %gs
  1039fd:	0f a1                	pop    %fs
  1039ff:	07                   	pop    %es
  103a00:	1f                   	pop    %ds
  103a01:	61                   	popa   
  103a02:	fb                   	sti    
  103a03:	cf                   	iret   

00103a04 <int_handler212>:
  103a04:	fa                   	cli    
  103a05:	60                   	pusha  
  103a06:	1e                   	push   %ds
  103a07:	06                   	push   %es
  103a08:	0f a0                	push   %fs
  103a0a:	0f a8                	push   %gs
  103a0c:	53                   	push   %ebx
  103a0d:	66 bb 10 00          	mov    $0x10,%bx
  103a11:	8e db                	mov    %ebx,%ds
  103a13:	5b                   	pop    %ebx
  103a14:	6a 00                	push   $0x0
  103a16:	68 d4 00 00 00       	push   $0xd4
  103a1b:	e8 b0 cd ff ff       	call   1007d0 <interrupt_handler>
  103a20:	83 c4 08             	add    $0x8,%esp
  103a23:	0f a9                	pop    %gs
  103a25:	0f a1                	pop    %fs
  103a27:	07                   	pop    %es
  103a28:	1f                   	pop    %ds
  103a29:	61                   	popa   
  103a2a:	fb                   	sti    
  103a2b:	cf                   	iret   

00103a2c <int_handler213>:
  103a2c:	fa                   	cli    
  103a2d:	60                   	pusha  
  103a2e:	1e                   	push   %ds
  103a2f:	06                   	push   %es
  103a30:	0f a0                	push   %fs
  103a32:	0f a8                	push   %gs
  103a34:	53                   	push   %ebx
  103a35:	66 bb 10 00          	mov    $0x10,%bx
  103a39:	8e db                	mov    %ebx,%ds
  103a3b:	5b                   	pop    %ebx
  103a3c:	6a 00                	push   $0x0
  103a3e:	68 d5 00 00 00       	push   $0xd5
  103a43:	e8 88 cd ff ff       	call   1007d0 <interrupt_handler>
  103a48:	83 c4 08             	add    $0x8,%esp
  103a4b:	0f a9                	pop    %gs
  103a4d:	0f a1                	pop    %fs
  103a4f:	07                   	pop    %es
  103a50:	1f                   	pop    %ds
  103a51:	61                   	popa   
  103a52:	fb                   	sti    
  103a53:	cf                   	iret   

00103a54 <int_handler214>:
  103a54:	fa                   	cli    
  103a55:	60                   	pusha  
  103a56:	1e                   	push   %ds
  103a57:	06                   	push   %es
  103a58:	0f a0                	push   %fs
  103a5a:	0f a8                	push   %gs
  103a5c:	53                   	push   %ebx
  103a5d:	66 bb 10 00          	mov    $0x10,%bx
  103a61:	8e db                	mov    %ebx,%ds
  103a63:	5b                   	pop    %ebx
  103a64:	6a 00                	push   $0x0
  103a66:	68 d6 00 00 00       	push   $0xd6
  103a6b:	e8 60 cd ff ff       	call   1007d0 <interrupt_handler>
  103a70:	83 c4 08             	add    $0x8,%esp
  103a73:	0f a9                	pop    %gs
  103a75:	0f a1                	pop    %fs
  103a77:	07                   	pop    %es
  103a78:	1f                   	pop    %ds
  103a79:	61                   	popa   
  103a7a:	fb                   	sti    
  103a7b:	cf                   	iret   

00103a7c <int_handler215>:
  103a7c:	fa                   	cli    
  103a7d:	60                   	pusha  
  103a7e:	1e                   	push   %ds
  103a7f:	06                   	push   %es
  103a80:	0f a0                	push   %fs
  103a82:	0f a8                	push   %gs
  103a84:	53                   	push   %ebx
  103a85:	66 bb 10 00          	mov    $0x10,%bx
  103a89:	8e db                	mov    %ebx,%ds
  103a8b:	5b                   	pop    %ebx
  103a8c:	6a 00                	push   $0x0
  103a8e:	68 d7 00 00 00       	push   $0xd7
  103a93:	e8 38 cd ff ff       	call   1007d0 <interrupt_handler>
  103a98:	83 c4 08             	add    $0x8,%esp
  103a9b:	0f a9                	pop    %gs
  103a9d:	0f a1                	pop    %fs
  103a9f:	07                   	pop    %es
  103aa0:	1f                   	pop    %ds
  103aa1:	61                   	popa   
  103aa2:	fb                   	sti    
  103aa3:	cf                   	iret   

00103aa4 <int_handler216>:
  103aa4:	fa                   	cli    
  103aa5:	60                   	pusha  
  103aa6:	1e                   	push   %ds
  103aa7:	06                   	push   %es
  103aa8:	0f a0                	push   %fs
  103aaa:	0f a8                	push   %gs
  103aac:	53                   	push   %ebx
  103aad:	66 bb 10 00          	mov    $0x10,%bx
  103ab1:	8e db                	mov    %ebx,%ds
  103ab3:	5b                   	pop    %ebx
  103ab4:	6a 00                	push   $0x0
  103ab6:	68 d8 00 00 00       	push   $0xd8
  103abb:	e8 10 cd ff ff       	call   1007d0 <interrupt_handler>
  103ac0:	83 c4 08             	add    $0x8,%esp
  103ac3:	0f a9                	pop    %gs
  103ac5:	0f a1                	pop    %fs
  103ac7:	07                   	pop    %es
  103ac8:	1f                   	pop    %ds
  103ac9:	61                   	popa   
  103aca:	fb                   	sti    
  103acb:	cf                   	iret   

00103acc <int_handler217>:
  103acc:	fa                   	cli    
  103acd:	60                   	pusha  
  103ace:	1e                   	push   %ds
  103acf:	06                   	push   %es
  103ad0:	0f a0                	push   %fs
  103ad2:	0f a8                	push   %gs
  103ad4:	53                   	push   %ebx
  103ad5:	66 bb 10 00          	mov    $0x10,%bx
  103ad9:	8e db                	mov    %ebx,%ds
  103adb:	5b                   	pop    %ebx
  103adc:	6a 00                	push   $0x0
  103ade:	68 d9 00 00 00       	push   $0xd9
  103ae3:	e8 e8 cc ff ff       	call   1007d0 <interrupt_handler>
  103ae8:	83 c4 08             	add    $0x8,%esp
  103aeb:	0f a9                	pop    %gs
  103aed:	0f a1                	pop    %fs
  103aef:	07                   	pop    %es
  103af0:	1f                   	pop    %ds
  103af1:	61                   	popa   
  103af2:	fb                   	sti    
  103af3:	cf                   	iret   

00103af4 <int_handler218>:
  103af4:	fa                   	cli    
  103af5:	60                   	pusha  
  103af6:	1e                   	push   %ds
  103af7:	06                   	push   %es
  103af8:	0f a0                	push   %fs
  103afa:	0f a8                	push   %gs
  103afc:	53                   	push   %ebx
  103afd:	66 bb 10 00          	mov    $0x10,%bx
  103b01:	8e db                	mov    %ebx,%ds
  103b03:	5b                   	pop    %ebx
  103b04:	6a 00                	push   $0x0
  103b06:	68 da 00 00 00       	push   $0xda
  103b0b:	e8 c0 cc ff ff       	call   1007d0 <interrupt_handler>
  103b10:	83 c4 08             	add    $0x8,%esp
  103b13:	0f a9                	pop    %gs
  103b15:	0f a1                	pop    %fs
  103b17:	07                   	pop    %es
  103b18:	1f                   	pop    %ds
  103b19:	61                   	popa   
  103b1a:	fb                   	sti    
  103b1b:	cf                   	iret   

00103b1c <int_handler219>:
  103b1c:	fa                   	cli    
  103b1d:	60                   	pusha  
  103b1e:	1e                   	push   %ds
  103b1f:	06                   	push   %es
  103b20:	0f a0                	push   %fs
  103b22:	0f a8                	push   %gs
  103b24:	53                   	push   %ebx
  103b25:	66 bb 10 00          	mov    $0x10,%bx
  103b29:	8e db                	mov    %ebx,%ds
  103b2b:	5b                   	pop    %ebx
  103b2c:	6a 00                	push   $0x0
  103b2e:	68 db 00 00 00       	push   $0xdb
  103b33:	e8 98 cc ff ff       	call   1007d0 <interrupt_handler>
  103b38:	83 c4 08             	add    $0x8,%esp
  103b3b:	0f a9                	pop    %gs
  103b3d:	0f a1                	pop    %fs
  103b3f:	07                   	pop    %es
  103b40:	1f                   	pop    %ds
  103b41:	61                   	popa   
  103b42:	fb                   	sti    
  103b43:	cf                   	iret   

00103b44 <int_handler220>:
  103b44:	fa                   	cli    
  103b45:	60                   	pusha  
  103b46:	1e                   	push   %ds
  103b47:	06                   	push   %es
  103b48:	0f a0                	push   %fs
  103b4a:	0f a8                	push   %gs
  103b4c:	53                   	push   %ebx
  103b4d:	66 bb 10 00          	mov    $0x10,%bx
  103b51:	8e db                	mov    %ebx,%ds
  103b53:	5b                   	pop    %ebx
  103b54:	6a 00                	push   $0x0
  103b56:	68 dc 00 00 00       	push   $0xdc
  103b5b:	e8 70 cc ff ff       	call   1007d0 <interrupt_handler>
  103b60:	83 c4 08             	add    $0x8,%esp
  103b63:	0f a9                	pop    %gs
  103b65:	0f a1                	pop    %fs
  103b67:	07                   	pop    %es
  103b68:	1f                   	pop    %ds
  103b69:	61                   	popa   
  103b6a:	fb                   	sti    
  103b6b:	cf                   	iret   

00103b6c <int_handler221>:
  103b6c:	fa                   	cli    
  103b6d:	60                   	pusha  
  103b6e:	1e                   	push   %ds
  103b6f:	06                   	push   %es
  103b70:	0f a0                	push   %fs
  103b72:	0f a8                	push   %gs
  103b74:	53                   	push   %ebx
  103b75:	66 bb 10 00          	mov    $0x10,%bx
  103b79:	8e db                	mov    %ebx,%ds
  103b7b:	5b                   	pop    %ebx
  103b7c:	6a 00                	push   $0x0
  103b7e:	68 dd 00 00 00       	push   $0xdd
  103b83:	e8 48 cc ff ff       	call   1007d0 <interrupt_handler>
  103b88:	83 c4 08             	add    $0x8,%esp
  103b8b:	0f a9                	pop    %gs
  103b8d:	0f a1                	pop    %fs
  103b8f:	07                   	pop    %es
  103b90:	1f                   	pop    %ds
  103b91:	61                   	popa   
  103b92:	fb                   	sti    
  103b93:	cf                   	iret   

00103b94 <int_handler222>:
  103b94:	fa                   	cli    
  103b95:	60                   	pusha  
  103b96:	1e                   	push   %ds
  103b97:	06                   	push   %es
  103b98:	0f a0                	push   %fs
  103b9a:	0f a8                	push   %gs
  103b9c:	53                   	push   %ebx
  103b9d:	66 bb 10 00          	mov    $0x10,%bx
  103ba1:	8e db                	mov    %ebx,%ds
  103ba3:	5b                   	pop    %ebx
  103ba4:	6a 00                	push   $0x0
  103ba6:	68 de 00 00 00       	push   $0xde
  103bab:	e8 20 cc ff ff       	call   1007d0 <interrupt_handler>
  103bb0:	83 c4 08             	add    $0x8,%esp
  103bb3:	0f a9                	pop    %gs
  103bb5:	0f a1                	pop    %fs
  103bb7:	07                   	pop    %es
  103bb8:	1f                   	pop    %ds
  103bb9:	61                   	popa   
  103bba:	fb                   	sti    
  103bbb:	cf                   	iret   

00103bbc <int_handler223>:
  103bbc:	fa                   	cli    
  103bbd:	60                   	pusha  
  103bbe:	1e                   	push   %ds
  103bbf:	06                   	push   %es
  103bc0:	0f a0                	push   %fs
  103bc2:	0f a8                	push   %gs
  103bc4:	53                   	push   %ebx
  103bc5:	66 bb 10 00          	mov    $0x10,%bx
  103bc9:	8e db                	mov    %ebx,%ds
  103bcb:	5b                   	pop    %ebx
  103bcc:	6a 00                	push   $0x0
  103bce:	68 df 00 00 00       	push   $0xdf
  103bd3:	e8 f8 cb ff ff       	call   1007d0 <interrupt_handler>
  103bd8:	83 c4 08             	add    $0x8,%esp
  103bdb:	0f a9                	pop    %gs
  103bdd:	0f a1                	pop    %fs
  103bdf:	07                   	pop    %es
  103be0:	1f                   	pop    %ds
  103be1:	61                   	popa   
  103be2:	fb                   	sti    
  103be3:	cf                   	iret   

00103be4 <int_handler224>:
  103be4:	fa                   	cli    
  103be5:	60                   	pusha  
  103be6:	1e                   	push   %ds
  103be7:	06                   	push   %es
  103be8:	0f a0                	push   %fs
  103bea:	0f a8                	push   %gs
  103bec:	53                   	push   %ebx
  103bed:	66 bb 10 00          	mov    $0x10,%bx
  103bf1:	8e db                	mov    %ebx,%ds
  103bf3:	5b                   	pop    %ebx
  103bf4:	6a 00                	push   $0x0
  103bf6:	68 e0 00 00 00       	push   $0xe0
  103bfb:	e8 d0 cb ff ff       	call   1007d0 <interrupt_handler>
  103c00:	83 c4 08             	add    $0x8,%esp
  103c03:	0f a9                	pop    %gs
  103c05:	0f a1                	pop    %fs
  103c07:	07                   	pop    %es
  103c08:	1f                   	pop    %ds
  103c09:	61                   	popa   
  103c0a:	fb                   	sti    
  103c0b:	cf                   	iret   

00103c0c <int_handler225>:
  103c0c:	fa                   	cli    
  103c0d:	60                   	pusha  
  103c0e:	1e                   	push   %ds
  103c0f:	06                   	push   %es
  103c10:	0f a0                	push   %fs
  103c12:	0f a8                	push   %gs
  103c14:	53                   	push   %ebx
  103c15:	66 bb 10 00          	mov    $0x10,%bx
  103c19:	8e db                	mov    %ebx,%ds
  103c1b:	5b                   	pop    %ebx
  103c1c:	6a 00                	push   $0x0
  103c1e:	68 e1 00 00 00       	push   $0xe1
  103c23:	e8 a8 cb ff ff       	call   1007d0 <interrupt_handler>
  103c28:	83 c4 08             	add    $0x8,%esp
  103c2b:	0f a9                	pop    %gs
  103c2d:	0f a1                	pop    %fs
  103c2f:	07                   	pop    %es
  103c30:	1f                   	pop    %ds
  103c31:	61                   	popa   
  103c32:	fb                   	sti    
  103c33:	cf                   	iret   

00103c34 <int_handler226>:
  103c34:	fa                   	cli    
  103c35:	60                   	pusha  
  103c36:	1e                   	push   %ds
  103c37:	06                   	push   %es
  103c38:	0f a0                	push   %fs
  103c3a:	0f a8                	push   %gs
  103c3c:	53                   	push   %ebx
  103c3d:	66 bb 10 00          	mov    $0x10,%bx
  103c41:	8e db                	mov    %ebx,%ds
  103c43:	5b                   	pop    %ebx
  103c44:	6a 00                	push   $0x0
  103c46:	68 e2 00 00 00       	push   $0xe2
  103c4b:	e8 80 cb ff ff       	call   1007d0 <interrupt_handler>
  103c50:	83 c4 08             	add    $0x8,%esp
  103c53:	0f a9                	pop    %gs
  103c55:	0f a1                	pop    %fs
  103c57:	07                   	pop    %es
  103c58:	1f                   	pop    %ds
  103c59:	61                   	popa   
  103c5a:	fb                   	sti    
  103c5b:	cf                   	iret   

00103c5c <int_handler227>:
  103c5c:	fa                   	cli    
  103c5d:	60                   	pusha  
  103c5e:	1e                   	push   %ds
  103c5f:	06                   	push   %es
  103c60:	0f a0                	push   %fs
  103c62:	0f a8                	push   %gs
  103c64:	53                   	push   %ebx
  103c65:	66 bb 10 00          	mov    $0x10,%bx
  103c69:	8e db                	mov    %ebx,%ds
  103c6b:	5b                   	pop    %ebx
  103c6c:	6a 00                	push   $0x0
  103c6e:	68 e3 00 00 00       	push   $0xe3
  103c73:	e8 58 cb ff ff       	call   1007d0 <interrupt_handler>
  103c78:	83 c4 08             	add    $0x8,%esp
  103c7b:	0f a9                	pop    %gs
  103c7d:	0f a1                	pop    %fs
  103c7f:	07                   	pop    %es
  103c80:	1f                   	pop    %ds
  103c81:	61                   	popa   
  103c82:	fb                   	sti    
  103c83:	cf                   	iret   

00103c84 <int_handler228>:
  103c84:	fa                   	cli    
  103c85:	60                   	pusha  
  103c86:	1e                   	push   %ds
  103c87:	06                   	push   %es
  103c88:	0f a0                	push   %fs
  103c8a:	0f a8                	push   %gs
  103c8c:	53                   	push   %ebx
  103c8d:	66 bb 10 00          	mov    $0x10,%bx
  103c91:	8e db                	mov    %ebx,%ds
  103c93:	5b                   	pop    %ebx
  103c94:	6a 00                	push   $0x0
  103c96:	68 e4 00 00 00       	push   $0xe4
  103c9b:	e8 30 cb ff ff       	call   1007d0 <interrupt_handler>
  103ca0:	83 c4 08             	add    $0x8,%esp
  103ca3:	0f a9                	pop    %gs
  103ca5:	0f a1                	pop    %fs
  103ca7:	07                   	pop    %es
  103ca8:	1f                   	pop    %ds
  103ca9:	61                   	popa   
  103caa:	fb                   	sti    
  103cab:	cf                   	iret   

00103cac <int_handler229>:
  103cac:	fa                   	cli    
  103cad:	60                   	pusha  
  103cae:	1e                   	push   %ds
  103caf:	06                   	push   %es
  103cb0:	0f a0                	push   %fs
  103cb2:	0f a8                	push   %gs
  103cb4:	53                   	push   %ebx
  103cb5:	66 bb 10 00          	mov    $0x10,%bx
  103cb9:	8e db                	mov    %ebx,%ds
  103cbb:	5b                   	pop    %ebx
  103cbc:	6a 00                	push   $0x0
  103cbe:	68 e5 00 00 00       	push   $0xe5
  103cc3:	e8 08 cb ff ff       	call   1007d0 <interrupt_handler>
  103cc8:	83 c4 08             	add    $0x8,%esp
  103ccb:	0f a9                	pop    %gs
  103ccd:	0f a1                	pop    %fs
  103ccf:	07                   	pop    %es
  103cd0:	1f                   	pop    %ds
  103cd1:	61                   	popa   
  103cd2:	fb                   	sti    
  103cd3:	cf                   	iret   

00103cd4 <int_handler230>:
  103cd4:	fa                   	cli    
  103cd5:	60                   	pusha  
  103cd6:	1e                   	push   %ds
  103cd7:	06                   	push   %es
  103cd8:	0f a0                	push   %fs
  103cda:	0f a8                	push   %gs
  103cdc:	53                   	push   %ebx
  103cdd:	66 bb 10 00          	mov    $0x10,%bx
  103ce1:	8e db                	mov    %ebx,%ds
  103ce3:	5b                   	pop    %ebx
  103ce4:	6a 00                	push   $0x0
  103ce6:	68 e6 00 00 00       	push   $0xe6
  103ceb:	e8 e0 ca ff ff       	call   1007d0 <interrupt_handler>
  103cf0:	83 c4 08             	add    $0x8,%esp
  103cf3:	0f a9                	pop    %gs
  103cf5:	0f a1                	pop    %fs
  103cf7:	07                   	pop    %es
  103cf8:	1f                   	pop    %ds
  103cf9:	61                   	popa   
  103cfa:	fb                   	sti    
  103cfb:	cf                   	iret   

00103cfc <int_handler231>:
  103cfc:	fa                   	cli    
  103cfd:	60                   	pusha  
  103cfe:	1e                   	push   %ds
  103cff:	06                   	push   %es
  103d00:	0f a0                	push   %fs
  103d02:	0f a8                	push   %gs
  103d04:	53                   	push   %ebx
  103d05:	66 bb 10 00          	mov    $0x10,%bx
  103d09:	8e db                	mov    %ebx,%ds
  103d0b:	5b                   	pop    %ebx
  103d0c:	6a 00                	push   $0x0
  103d0e:	68 e7 00 00 00       	push   $0xe7
  103d13:	e8 b8 ca ff ff       	call   1007d0 <interrupt_handler>
  103d18:	83 c4 08             	add    $0x8,%esp
  103d1b:	0f a9                	pop    %gs
  103d1d:	0f a1                	pop    %fs
  103d1f:	07                   	pop    %es
  103d20:	1f                   	pop    %ds
  103d21:	61                   	popa   
  103d22:	fb                   	sti    
  103d23:	cf                   	iret   

00103d24 <int_handler232>:
  103d24:	fa                   	cli    
  103d25:	60                   	pusha  
  103d26:	1e                   	push   %ds
  103d27:	06                   	push   %es
  103d28:	0f a0                	push   %fs
  103d2a:	0f a8                	push   %gs
  103d2c:	53                   	push   %ebx
  103d2d:	66 bb 10 00          	mov    $0x10,%bx
  103d31:	8e db                	mov    %ebx,%ds
  103d33:	5b                   	pop    %ebx
  103d34:	6a 00                	push   $0x0
  103d36:	68 e8 00 00 00       	push   $0xe8
  103d3b:	e8 90 ca ff ff       	call   1007d0 <interrupt_handler>
  103d40:	83 c4 08             	add    $0x8,%esp
  103d43:	0f a9                	pop    %gs
  103d45:	0f a1                	pop    %fs
  103d47:	07                   	pop    %es
  103d48:	1f                   	pop    %ds
  103d49:	61                   	popa   
  103d4a:	fb                   	sti    
  103d4b:	cf                   	iret   

00103d4c <int_handler233>:
  103d4c:	fa                   	cli    
  103d4d:	60                   	pusha  
  103d4e:	1e                   	push   %ds
  103d4f:	06                   	push   %es
  103d50:	0f a0                	push   %fs
  103d52:	0f a8                	push   %gs
  103d54:	53                   	push   %ebx
  103d55:	66 bb 10 00          	mov    $0x10,%bx
  103d59:	8e db                	mov    %ebx,%ds
  103d5b:	5b                   	pop    %ebx
  103d5c:	6a 00                	push   $0x0
  103d5e:	68 e9 00 00 00       	push   $0xe9
  103d63:	e8 68 ca ff ff       	call   1007d0 <interrupt_handler>
  103d68:	83 c4 08             	add    $0x8,%esp
  103d6b:	0f a9                	pop    %gs
  103d6d:	0f a1                	pop    %fs
  103d6f:	07                   	pop    %es
  103d70:	1f                   	pop    %ds
  103d71:	61                   	popa   
  103d72:	fb                   	sti    
  103d73:	cf                   	iret   

00103d74 <int_handler234>:
  103d74:	fa                   	cli    
  103d75:	60                   	pusha  
  103d76:	1e                   	push   %ds
  103d77:	06                   	push   %es
  103d78:	0f a0                	push   %fs
  103d7a:	0f a8                	push   %gs
  103d7c:	53                   	push   %ebx
  103d7d:	66 bb 10 00          	mov    $0x10,%bx
  103d81:	8e db                	mov    %ebx,%ds
  103d83:	5b                   	pop    %ebx
  103d84:	6a 00                	push   $0x0
  103d86:	68 ea 00 00 00       	push   $0xea
  103d8b:	e8 40 ca ff ff       	call   1007d0 <interrupt_handler>
  103d90:	83 c4 08             	add    $0x8,%esp
  103d93:	0f a9                	pop    %gs
  103d95:	0f a1                	pop    %fs
  103d97:	07                   	pop    %es
  103d98:	1f                   	pop    %ds
  103d99:	61                   	popa   
  103d9a:	fb                   	sti    
  103d9b:	cf                   	iret   

00103d9c <int_handler235>:
  103d9c:	fa                   	cli    
  103d9d:	60                   	pusha  
  103d9e:	1e                   	push   %ds
  103d9f:	06                   	push   %es
  103da0:	0f a0                	push   %fs
  103da2:	0f a8                	push   %gs
  103da4:	53                   	push   %ebx
  103da5:	66 bb 10 00          	mov    $0x10,%bx
  103da9:	8e db                	mov    %ebx,%ds
  103dab:	5b                   	pop    %ebx
  103dac:	6a 00                	push   $0x0
  103dae:	68 eb 00 00 00       	push   $0xeb
  103db3:	e8 18 ca ff ff       	call   1007d0 <interrupt_handler>
  103db8:	83 c4 08             	add    $0x8,%esp
  103dbb:	0f a9                	pop    %gs
  103dbd:	0f a1                	pop    %fs
  103dbf:	07                   	pop    %es
  103dc0:	1f                   	pop    %ds
  103dc1:	61                   	popa   
  103dc2:	fb                   	sti    
  103dc3:	cf                   	iret   

00103dc4 <int_handler236>:
  103dc4:	fa                   	cli    
  103dc5:	60                   	pusha  
  103dc6:	1e                   	push   %ds
  103dc7:	06                   	push   %es
  103dc8:	0f a0                	push   %fs
  103dca:	0f a8                	push   %gs
  103dcc:	53                   	push   %ebx
  103dcd:	66 bb 10 00          	mov    $0x10,%bx
  103dd1:	8e db                	mov    %ebx,%ds
  103dd3:	5b                   	pop    %ebx
  103dd4:	6a 00                	push   $0x0
  103dd6:	68 ec 00 00 00       	push   $0xec
  103ddb:	e8 f0 c9 ff ff       	call   1007d0 <interrupt_handler>
  103de0:	83 c4 08             	add    $0x8,%esp
  103de3:	0f a9                	pop    %gs
  103de5:	0f a1                	pop    %fs
  103de7:	07                   	pop    %es
  103de8:	1f                   	pop    %ds
  103de9:	61                   	popa   
  103dea:	fb                   	sti    
  103deb:	cf                   	iret   

00103dec <int_handler237>:
  103dec:	fa                   	cli    
  103ded:	60                   	pusha  
  103dee:	1e                   	push   %ds
  103def:	06                   	push   %es
  103df0:	0f a0                	push   %fs
  103df2:	0f a8                	push   %gs
  103df4:	53                   	push   %ebx
  103df5:	66 bb 10 00          	mov    $0x10,%bx
  103df9:	8e db                	mov    %ebx,%ds
  103dfb:	5b                   	pop    %ebx
  103dfc:	6a 00                	push   $0x0
  103dfe:	68 ed 00 00 00       	push   $0xed
  103e03:	e8 c8 c9 ff ff       	call   1007d0 <interrupt_handler>
  103e08:	83 c4 08             	add    $0x8,%esp
  103e0b:	0f a9                	pop    %gs
  103e0d:	0f a1                	pop    %fs
  103e0f:	07                   	pop    %es
  103e10:	1f                   	pop    %ds
  103e11:	61                   	popa   
  103e12:	fb                   	sti    
  103e13:	cf                   	iret   

00103e14 <int_handler238>:
  103e14:	fa                   	cli    
  103e15:	60                   	pusha  
  103e16:	1e                   	push   %ds
  103e17:	06                   	push   %es
  103e18:	0f a0                	push   %fs
  103e1a:	0f a8                	push   %gs
  103e1c:	53                   	push   %ebx
  103e1d:	66 bb 10 00          	mov    $0x10,%bx
  103e21:	8e db                	mov    %ebx,%ds
  103e23:	5b                   	pop    %ebx
  103e24:	6a 00                	push   $0x0
  103e26:	68 ee 00 00 00       	push   $0xee
  103e2b:	e8 a0 c9 ff ff       	call   1007d0 <interrupt_handler>
  103e30:	83 c4 08             	add    $0x8,%esp
  103e33:	0f a9                	pop    %gs
  103e35:	0f a1                	pop    %fs
  103e37:	07                   	pop    %es
  103e38:	1f                   	pop    %ds
  103e39:	61                   	popa   
  103e3a:	fb                   	sti    
  103e3b:	cf                   	iret   

00103e3c <int_handler239>:
  103e3c:	fa                   	cli    
  103e3d:	60                   	pusha  
  103e3e:	1e                   	push   %ds
  103e3f:	06                   	push   %es
  103e40:	0f a0                	push   %fs
  103e42:	0f a8                	push   %gs
  103e44:	53                   	push   %ebx
  103e45:	66 bb 10 00          	mov    $0x10,%bx
  103e49:	8e db                	mov    %ebx,%ds
  103e4b:	5b                   	pop    %ebx
  103e4c:	6a 00                	push   $0x0
  103e4e:	68 ef 00 00 00       	push   $0xef
  103e53:	e8 78 c9 ff ff       	call   1007d0 <interrupt_handler>
  103e58:	83 c4 08             	add    $0x8,%esp
  103e5b:	0f a9                	pop    %gs
  103e5d:	0f a1                	pop    %fs
  103e5f:	07                   	pop    %es
  103e60:	1f                   	pop    %ds
  103e61:	61                   	popa   
  103e62:	fb                   	sti    
  103e63:	cf                   	iret   

00103e64 <int_handler240>:
  103e64:	fa                   	cli    
  103e65:	60                   	pusha  
  103e66:	1e                   	push   %ds
  103e67:	06                   	push   %es
  103e68:	0f a0                	push   %fs
  103e6a:	0f a8                	push   %gs
  103e6c:	53                   	push   %ebx
  103e6d:	66 bb 10 00          	mov    $0x10,%bx
  103e71:	8e db                	mov    %ebx,%ds
  103e73:	5b                   	pop    %ebx
  103e74:	6a 00                	push   $0x0
  103e76:	68 f0 00 00 00       	push   $0xf0
  103e7b:	e8 50 c9 ff ff       	call   1007d0 <interrupt_handler>
  103e80:	83 c4 08             	add    $0x8,%esp
  103e83:	0f a9                	pop    %gs
  103e85:	0f a1                	pop    %fs
  103e87:	07                   	pop    %es
  103e88:	1f                   	pop    %ds
  103e89:	61                   	popa   
  103e8a:	fb                   	sti    
  103e8b:	cf                   	iret   

00103e8c <int_handler241>:
  103e8c:	fa                   	cli    
  103e8d:	60                   	pusha  
  103e8e:	1e                   	push   %ds
  103e8f:	06                   	push   %es
  103e90:	0f a0                	push   %fs
  103e92:	0f a8                	push   %gs
  103e94:	53                   	push   %ebx
  103e95:	66 bb 10 00          	mov    $0x10,%bx
  103e99:	8e db                	mov    %ebx,%ds
  103e9b:	5b                   	pop    %ebx
  103e9c:	6a 00                	push   $0x0
  103e9e:	68 f1 00 00 00       	push   $0xf1
  103ea3:	e8 28 c9 ff ff       	call   1007d0 <interrupt_handler>
  103ea8:	83 c4 08             	add    $0x8,%esp
  103eab:	0f a9                	pop    %gs
  103ead:	0f a1                	pop    %fs
  103eaf:	07                   	pop    %es
  103eb0:	1f                   	pop    %ds
  103eb1:	61                   	popa   
  103eb2:	fb                   	sti    
  103eb3:	cf                   	iret   

00103eb4 <int_handler242>:
  103eb4:	fa                   	cli    
  103eb5:	60                   	pusha  
  103eb6:	1e                   	push   %ds
  103eb7:	06                   	push   %es
  103eb8:	0f a0                	push   %fs
  103eba:	0f a8                	push   %gs
  103ebc:	53                   	push   %ebx
  103ebd:	66 bb 10 00          	mov    $0x10,%bx
  103ec1:	8e db                	mov    %ebx,%ds
  103ec3:	5b                   	pop    %ebx
  103ec4:	6a 00                	push   $0x0
  103ec6:	68 f2 00 00 00       	push   $0xf2
  103ecb:	e8 00 c9 ff ff       	call   1007d0 <interrupt_handler>
  103ed0:	83 c4 08             	add    $0x8,%esp
  103ed3:	0f a9                	pop    %gs
  103ed5:	0f a1                	pop    %fs
  103ed7:	07                   	pop    %es
  103ed8:	1f                   	pop    %ds
  103ed9:	61                   	popa   
  103eda:	fb                   	sti    
  103edb:	cf                   	iret   

00103edc <int_handler243>:
  103edc:	fa                   	cli    
  103edd:	60                   	pusha  
  103ede:	1e                   	push   %ds
  103edf:	06                   	push   %es
  103ee0:	0f a0                	push   %fs
  103ee2:	0f a8                	push   %gs
  103ee4:	53                   	push   %ebx
  103ee5:	66 bb 10 00          	mov    $0x10,%bx
  103ee9:	8e db                	mov    %ebx,%ds
  103eeb:	5b                   	pop    %ebx
  103eec:	6a 00                	push   $0x0
  103eee:	68 f3 00 00 00       	push   $0xf3
  103ef3:	e8 d8 c8 ff ff       	call   1007d0 <interrupt_handler>
  103ef8:	83 c4 08             	add    $0x8,%esp
  103efb:	0f a9                	pop    %gs
  103efd:	0f a1                	pop    %fs
  103eff:	07                   	pop    %es
  103f00:	1f                   	pop    %ds
  103f01:	61                   	popa   
  103f02:	fb                   	sti    
  103f03:	cf                   	iret   

00103f04 <int_handler244>:
  103f04:	fa                   	cli    
  103f05:	60                   	pusha  
  103f06:	1e                   	push   %ds
  103f07:	06                   	push   %es
  103f08:	0f a0                	push   %fs
  103f0a:	0f a8                	push   %gs
  103f0c:	53                   	push   %ebx
  103f0d:	66 bb 10 00          	mov    $0x10,%bx
  103f11:	8e db                	mov    %ebx,%ds
  103f13:	5b                   	pop    %ebx
  103f14:	6a 00                	push   $0x0
  103f16:	68 f4 00 00 00       	push   $0xf4
  103f1b:	e8 b0 c8 ff ff       	call   1007d0 <interrupt_handler>
  103f20:	83 c4 08             	add    $0x8,%esp
  103f23:	0f a9                	pop    %gs
  103f25:	0f a1                	pop    %fs
  103f27:	07                   	pop    %es
  103f28:	1f                   	pop    %ds
  103f29:	61                   	popa   
  103f2a:	fb                   	sti    
  103f2b:	cf                   	iret   

00103f2c <int_handler245>:
  103f2c:	fa                   	cli    
  103f2d:	60                   	pusha  
  103f2e:	1e                   	push   %ds
  103f2f:	06                   	push   %es
  103f30:	0f a0                	push   %fs
  103f32:	0f a8                	push   %gs
  103f34:	53                   	push   %ebx
  103f35:	66 bb 10 00          	mov    $0x10,%bx
  103f39:	8e db                	mov    %ebx,%ds
  103f3b:	5b                   	pop    %ebx
  103f3c:	6a 00                	push   $0x0
  103f3e:	68 f5 00 00 00       	push   $0xf5
  103f43:	e8 88 c8 ff ff       	call   1007d0 <interrupt_handler>
  103f48:	83 c4 08             	add    $0x8,%esp
  103f4b:	0f a9                	pop    %gs
  103f4d:	0f a1                	pop    %fs
  103f4f:	07                   	pop    %es
  103f50:	1f                   	pop    %ds
  103f51:	61                   	popa   
  103f52:	fb                   	sti    
  103f53:	cf                   	iret   

00103f54 <int_handler246>:
  103f54:	fa                   	cli    
  103f55:	60                   	pusha  
  103f56:	1e                   	push   %ds
  103f57:	06                   	push   %es
  103f58:	0f a0                	push   %fs
  103f5a:	0f a8                	push   %gs
  103f5c:	53                   	push   %ebx
  103f5d:	66 bb 10 00          	mov    $0x10,%bx
  103f61:	8e db                	mov    %ebx,%ds
  103f63:	5b                   	pop    %ebx
  103f64:	6a 00                	push   $0x0
  103f66:	68 f6 00 00 00       	push   $0xf6
  103f6b:	e8 60 c8 ff ff       	call   1007d0 <interrupt_handler>
  103f70:	83 c4 08             	add    $0x8,%esp
  103f73:	0f a9                	pop    %gs
  103f75:	0f a1                	pop    %fs
  103f77:	07                   	pop    %es
  103f78:	1f                   	pop    %ds
  103f79:	61                   	popa   
  103f7a:	fb                   	sti    
  103f7b:	cf                   	iret   

00103f7c <int_handler247>:
  103f7c:	fa                   	cli    
  103f7d:	60                   	pusha  
  103f7e:	1e                   	push   %ds
  103f7f:	06                   	push   %es
  103f80:	0f a0                	push   %fs
  103f82:	0f a8                	push   %gs
  103f84:	53                   	push   %ebx
  103f85:	66 bb 10 00          	mov    $0x10,%bx
  103f89:	8e db                	mov    %ebx,%ds
  103f8b:	5b                   	pop    %ebx
  103f8c:	6a 00                	push   $0x0
  103f8e:	68 f7 00 00 00       	push   $0xf7
  103f93:	e8 38 c8 ff ff       	call   1007d0 <interrupt_handler>
  103f98:	83 c4 08             	add    $0x8,%esp
  103f9b:	0f a9                	pop    %gs
  103f9d:	0f a1                	pop    %fs
  103f9f:	07                   	pop    %es
  103fa0:	1f                   	pop    %ds
  103fa1:	61                   	popa   
  103fa2:	fb                   	sti    
  103fa3:	cf                   	iret   

00103fa4 <int_handler248>:
  103fa4:	fa                   	cli    
  103fa5:	60                   	pusha  
  103fa6:	1e                   	push   %ds
  103fa7:	06                   	push   %es
  103fa8:	0f a0                	push   %fs
  103faa:	0f a8                	push   %gs
  103fac:	53                   	push   %ebx
  103fad:	66 bb 10 00          	mov    $0x10,%bx
  103fb1:	8e db                	mov    %ebx,%ds
  103fb3:	5b                   	pop    %ebx
  103fb4:	6a 00                	push   $0x0
  103fb6:	68 f8 00 00 00       	push   $0xf8
  103fbb:	e8 10 c8 ff ff       	call   1007d0 <interrupt_handler>
  103fc0:	83 c4 08             	add    $0x8,%esp
  103fc3:	0f a9                	pop    %gs
  103fc5:	0f a1                	pop    %fs
  103fc7:	07                   	pop    %es
  103fc8:	1f                   	pop    %ds
  103fc9:	61                   	popa   
  103fca:	fb                   	sti    
  103fcb:	cf                   	iret   

00103fcc <int_handler249>:
  103fcc:	fa                   	cli    
  103fcd:	60                   	pusha  
  103fce:	1e                   	push   %ds
  103fcf:	06                   	push   %es
  103fd0:	0f a0                	push   %fs
  103fd2:	0f a8                	push   %gs
  103fd4:	53                   	push   %ebx
  103fd5:	66 bb 10 00          	mov    $0x10,%bx
  103fd9:	8e db                	mov    %ebx,%ds
  103fdb:	5b                   	pop    %ebx
  103fdc:	6a 00                	push   $0x0
  103fde:	68 f9 00 00 00       	push   $0xf9
  103fe3:	e8 e8 c7 ff ff       	call   1007d0 <interrupt_handler>
  103fe8:	83 c4 08             	add    $0x8,%esp
  103feb:	0f a9                	pop    %gs
  103fed:	0f a1                	pop    %fs
  103fef:	07                   	pop    %es
  103ff0:	1f                   	pop    %ds
  103ff1:	61                   	popa   
  103ff2:	fb                   	sti    
  103ff3:	cf                   	iret   

00103ff4 <int_handler250>:
  103ff4:	fa                   	cli    
  103ff5:	60                   	pusha  
  103ff6:	1e                   	push   %ds
  103ff7:	06                   	push   %es
  103ff8:	0f a0                	push   %fs
  103ffa:	0f a8                	push   %gs
  103ffc:	53                   	push   %ebx
  103ffd:	66 bb 10 00          	mov    $0x10,%bx
  104001:	8e db                	mov    %ebx,%ds
  104003:	5b                   	pop    %ebx
  104004:	6a 00                	push   $0x0
  104006:	68 fa 00 00 00       	push   $0xfa
  10400b:	e8 c0 c7 ff ff       	call   1007d0 <interrupt_handler>
  104010:	83 c4 08             	add    $0x8,%esp
  104013:	0f a9                	pop    %gs
  104015:	0f a1                	pop    %fs
  104017:	07                   	pop    %es
  104018:	1f                   	pop    %ds
  104019:	61                   	popa   
  10401a:	fb                   	sti    
  10401b:	cf                   	iret   

0010401c <int_handler251>:
  10401c:	fa                   	cli    
  10401d:	60                   	pusha  
  10401e:	1e                   	push   %ds
  10401f:	06                   	push   %es
  104020:	0f a0                	push   %fs
  104022:	0f a8                	push   %gs
  104024:	53                   	push   %ebx
  104025:	66 bb 10 00          	mov    $0x10,%bx
  104029:	8e db                	mov    %ebx,%ds
  10402b:	5b                   	pop    %ebx
  10402c:	6a 00                	push   $0x0
  10402e:	68 fb 00 00 00       	push   $0xfb
  104033:	e8 98 c7 ff ff       	call   1007d0 <interrupt_handler>
  104038:	83 c4 08             	add    $0x8,%esp
  10403b:	0f a9                	pop    %gs
  10403d:	0f a1                	pop    %fs
  10403f:	07                   	pop    %es
  104040:	1f                   	pop    %ds
  104041:	61                   	popa   
  104042:	fb                   	sti    
  104043:	cf                   	iret   

00104044 <int_handler252>:
  104044:	fa                   	cli    
  104045:	60                   	pusha  
  104046:	1e                   	push   %ds
  104047:	06                   	push   %es
  104048:	0f a0                	push   %fs
  10404a:	0f a8                	push   %gs
  10404c:	53                   	push   %ebx
  10404d:	66 bb 10 00          	mov    $0x10,%bx
  104051:	8e db                	mov    %ebx,%ds
  104053:	5b                   	pop    %ebx
  104054:	6a 00                	push   $0x0
  104056:	68 fc 00 00 00       	push   $0xfc
  10405b:	e8 70 c7 ff ff       	call   1007d0 <interrupt_handler>
  104060:	83 c4 08             	add    $0x8,%esp
  104063:	0f a9                	pop    %gs
  104065:	0f a1                	pop    %fs
  104067:	07                   	pop    %es
  104068:	1f                   	pop    %ds
  104069:	61                   	popa   
  10406a:	fb                   	sti    
  10406b:	cf                   	iret   

0010406c <int_handler253>:
  10406c:	fa                   	cli    
  10406d:	60                   	pusha  
  10406e:	1e                   	push   %ds
  10406f:	06                   	push   %es
  104070:	0f a0                	push   %fs
  104072:	0f a8                	push   %gs
  104074:	53                   	push   %ebx
  104075:	66 bb 10 00          	mov    $0x10,%bx
  104079:	8e db                	mov    %ebx,%ds
  10407b:	5b                   	pop    %ebx
  10407c:	6a 00                	push   $0x0
  10407e:	68 fd 00 00 00       	push   $0xfd
  104083:	e8 48 c7 ff ff       	call   1007d0 <interrupt_handler>
  104088:	83 c4 08             	add    $0x8,%esp
  10408b:	0f a9                	pop    %gs
  10408d:	0f a1                	pop    %fs
  10408f:	07                   	pop    %es
  104090:	1f                   	pop    %ds
  104091:	61                   	popa   
  104092:	fb                   	sti    
  104093:	cf                   	iret   

00104094 <int_handler254>:
  104094:	fa                   	cli    
  104095:	60                   	pusha  
  104096:	1e                   	push   %ds
  104097:	06                   	push   %es
  104098:	0f a0                	push   %fs
  10409a:	0f a8                	push   %gs
  10409c:	53                   	push   %ebx
  10409d:	66 bb 10 00          	mov    $0x10,%bx
  1040a1:	8e db                	mov    %ebx,%ds
  1040a3:	5b                   	pop    %ebx
  1040a4:	6a 00                	push   $0x0
  1040a6:	68 fe 00 00 00       	push   $0xfe
  1040ab:	e8 20 c7 ff ff       	call   1007d0 <interrupt_handler>
  1040b0:	83 c4 08             	add    $0x8,%esp
  1040b3:	0f a9                	pop    %gs
  1040b5:	0f a1                	pop    %fs
  1040b7:	07                   	pop    %es
  1040b8:	1f                   	pop    %ds
  1040b9:	61                   	popa   
  1040ba:	fb                   	sti    
  1040bb:	cf                   	iret   

001040bc <int_handler255>:
  1040bc:	fa                   	cli    
  1040bd:	60                   	pusha  
  1040be:	1e                   	push   %ds
  1040bf:	06                   	push   %es
  1040c0:	0f a0                	push   %fs
  1040c2:	0f a8                	push   %gs
  1040c4:	53                   	push   %ebx
  1040c5:	66 bb 10 00          	mov    $0x10,%bx
  1040c9:	8e db                	mov    %ebx,%ds
  1040cb:	5b                   	pop    %ebx
  1040cc:	6a 00                	push   $0x0
  1040ce:	68 ff 00 00 00       	push   $0xff
  1040d3:	e8 f8 c6 ff ff       	call   1007d0 <interrupt_handler>
  1040d8:	83 c4 08             	add    $0x8,%esp
  1040db:	0f a9                	pop    %gs
  1040dd:	0f a1                	pop    %fs
  1040df:	07                   	pop    %es
  1040e0:	1f                   	pop    %ds
  1040e1:	61                   	popa   
  1040e2:	fb                   	sti    
  1040e3:	cf                   	iret   
  1040e4:	66 90                	xchg   %ax,%ax
  1040e6:	66 90                	xchg   %ax,%ax
  1040e8:	66 90                	xchg   %ax,%ax
  1040ea:	66 90                	xchg   %ax,%ax
  1040ec:	66 90                	xchg   %ax,%ax
  1040ee:	66 90                	xchg   %ax,%ax

001040f0 <_start>:
  1040f0:	bc c0 d4 10 00       	mov    $0x10d4c0,%esp
  1040f5:	53                   	push   %ebx
  1040f6:	e8 15 00 00 00       	call   104110 <main>
  1040fb:	83 c4 04             	add    $0x4,%esp
  1040fe:	fa                   	cli    

001040ff <_start.hang>:
  1040ff:	f4                   	hlt    
  104100:	eb fd                	jmp    1040ff <_start.hang>

Disassembly of section .text.startup:

00104110 <main>:
}



void main(multiboot_info_t * info)
{
  104110:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  104114:	83 e4 f0             	and    $0xfffffff0,%esp
  104117:	ff 71 fc             	pushl  -0x4(%ecx)
  10411a:	55                   	push   %ebp
  10411b:	89 e5                	mov    %esp,%ebp
  10411d:	57                   	push   %edi
  10411e:	56                   	push   %esi
  10411f:	53                   	push   %ebx
  104120:	51                   	push   %ecx
  104121:	83 ec 08             	sub    $0x8,%esp
    UNUSED(info);

    INSTALL(console);
  104124:	e8 97 cd ff ff       	call   100ec0 <install_console>
  104129:	83 ec 0c             	sub    $0xc,%esp
  10412c:	89 c3                	mov    %eax,%ebx
  10412e:	6a 00                	push   $0x0
  104130:	e8 6b d0 ff ff       	call   1011a0 <time_get>
  104135:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10413c:	89 c7                	mov    %eax,%edi
  10413e:	e8 5d d0 ff ff       	call   1011a0 <time_get>
  104143:	89 c6                	mov    %eax,%esi
  104145:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  10414c:	e8 4f d0 ff ff       	call   1011a0 <time_get>
  104151:	57                   	push   %edi
  104152:	56                   	push   %esi
  104153:	50                   	push   %eax
  104154:	68 06 61 10 00       	push   $0x106106
  104159:	e8 92 c5 ff ff       	call   1006f0 <kprintf>
  10415e:	83 c4 20             	add    $0x20,%esp
  104161:	84 db                	test   %bl,%bl
  104163:	0f 85 97 02 00 00    	jne    104400 <main+0x2f0>
  104169:	51                   	push   %ecx
  10416a:	51                   	push   %ecx
  10416b:	68 d0 61 10 00       	push   $0x1061d0
  104170:	68 d8 61 10 00       	push   $0x1061d8
  104175:	e8 76 c5 ff ff       	call   1006f0 <kprintf>
  10417a:	83 c4 10             	add    $0x10,%esp
    INSTALL(uart);
  10417d:	e8 2e d6 ff ff       	call   1017b0 <install_uart>
  104182:	83 ec 0c             	sub    $0xc,%esp
  104185:	89 c3                	mov    %eax,%ebx
  104187:	6a 00                	push   $0x0
  104189:	e8 12 d0 ff ff       	call   1011a0 <time_get>
  10418e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  104195:	89 c7                	mov    %eax,%edi
  104197:	e8 04 d0 ff ff       	call   1011a0 <time_get>
  10419c:	89 c6                	mov    %eax,%esi
  10419e:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  1041a5:	e8 f6 cf ff ff       	call   1011a0 <time_get>
  1041aa:	57                   	push   %edi
  1041ab:	56                   	push   %esi
  1041ac:	50                   	push   %eax
  1041ad:	68 06 61 10 00       	push   $0x106106
  1041b2:	e8 39 c5 ff ff       	call   1006f0 <kprintf>
  1041b7:	83 c4 20             	add    $0x20,%esp
  1041ba:	84 db                	test   %bl,%bl
  1041bc:	0f 85 bb 02 00 00    	jne    10447d <main+0x36d>
  1041c2:	50                   	push   %eax
  1041c3:	50                   	push   %eax
  1041c4:	68 04 62 10 00       	push   $0x106204
  1041c9:	68 d8 61 10 00       	push   $0x1061d8
  1041ce:	e8 1d c5 ff ff       	call   1006f0 <kprintf>
  1041d3:	83 c4 10             	add    $0x10,%esp
    INSTALL(gdt);
  1041d6:	e8 85 c7 ff ff       	call   100960 <install_gdt>
  1041db:	83 ec 0c             	sub    $0xc,%esp
  1041de:	89 c3                	mov    %eax,%ebx
  1041e0:	6a 00                	push   $0x0
  1041e2:	e8 b9 cf ff ff       	call   1011a0 <time_get>
  1041e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1041ee:	89 c7                	mov    %eax,%edi
  1041f0:	e8 ab cf ff ff       	call   1011a0 <time_get>
  1041f5:	89 c6                	mov    %eax,%esi
  1041f7:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  1041fe:	e8 9d cf ff ff       	call   1011a0 <time_get>
  104203:	57                   	push   %edi
  104204:	56                   	push   %esi
  104205:	50                   	push   %eax
  104206:	68 06 61 10 00       	push   $0x106106
  10420b:	e8 e0 c4 ff ff       	call   1006f0 <kprintf>
  104210:	83 c4 20             	add    $0x20,%esp
  104213:	84 db                	test   %bl,%bl
  104215:	0f 85 49 02 00 00    	jne    104464 <main+0x354>
  10421b:	50                   	push   %eax
  10421c:	50                   	push   %eax
  10421d:	68 09 62 10 00       	push   $0x106209
  104222:	68 d8 61 10 00       	push   $0x1061d8
  104227:	e8 c4 c4 ff ff       	call   1006f0 <kprintf>
  10422c:	83 c4 10             	add    $0x10,%esp
    INSTALL(interrupts);
  10422f:	e8 3c c6 ff ff       	call   100870 <install_interrupts>
  104234:	83 ec 0c             	sub    $0xc,%esp
  104237:	89 c3                	mov    %eax,%ebx
  104239:	6a 00                	push   $0x0
  10423b:	e8 60 cf ff ff       	call   1011a0 <time_get>
  104240:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  104247:	89 c7                	mov    %eax,%edi
  104249:	e8 52 cf ff ff       	call   1011a0 <time_get>
  10424e:	89 c6                	mov    %eax,%esi
  104250:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  104257:	e8 44 cf ff ff       	call   1011a0 <time_get>
  10425c:	57                   	push   %edi
  10425d:	56                   	push   %esi
  10425e:	50                   	push   %eax
  10425f:	68 06 61 10 00       	push   $0x106106
  104264:	e8 87 c4 ff ff       	call   1006f0 <kprintf>
  104269:	83 c4 20             	add    $0x20,%esp
  10426c:	84 db                	test   %bl,%bl
  10426e:	0f 85 d7 01 00 00    	jne    10444b <main+0x33b>
  104274:	50                   	push   %eax
  104275:	50                   	push   %eax
  104276:	68 0d 62 10 00       	push   $0x10620d
  10427b:	68 d8 61 10 00       	push   $0x1061d8
  104280:	e8 6b c4 ff ff       	call   1006f0 <kprintf>
  104285:	83 c4 10             	add    $0x10,%esp
    INSTALL(clock);
  104288:	e8 a3 d7 ff ff       	call   101a30 <install_clock>
  10428d:	83 ec 0c             	sub    $0xc,%esp
  104290:	89 c3                	mov    %eax,%ebx
  104292:	6a 00                	push   $0x0
  104294:	e8 07 cf ff ff       	call   1011a0 <time_get>
  104299:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1042a0:	89 c7                	mov    %eax,%edi
  1042a2:	e8 f9 ce ff ff       	call   1011a0 <time_get>
  1042a7:	89 c6                	mov    %eax,%esi
  1042a9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  1042b0:	e8 eb ce ff ff       	call   1011a0 <time_get>
  1042b5:	57                   	push   %edi
  1042b6:	56                   	push   %esi
  1042b7:	50                   	push   %eax
  1042b8:	68 06 61 10 00       	push   $0x106106
  1042bd:	e8 2e c4 ff ff       	call   1006f0 <kprintf>
  1042c2:	83 c4 20             	add    $0x20,%esp
  1042c5:	84 db                	test   %bl,%bl
  1042c7:	0f 85 65 01 00 00    	jne    104432 <main+0x322>
  1042cd:	57                   	push   %edi
  1042ce:	57                   	push   %edi
  1042cf:	68 18 62 10 00       	push   $0x106218
  1042d4:	68 d8 61 10 00       	push   $0x1061d8
  1042d9:	e8 12 c4 ff ff       	call   1006f0 <kprintf>
  1042de:	83 c4 10             	add    $0x10,%esp
    INSTALL(keyboard);
  1042e1:	e8 aa d4 ff ff       	call   101790 <install_keyboard>
  1042e6:	83 ec 0c             	sub    $0xc,%esp
  1042e9:	89 c3                	mov    %eax,%ebx
  1042eb:	6a 00                	push   $0x0
  1042ed:	e8 ae ce ff ff       	call   1011a0 <time_get>
  1042f2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1042f9:	89 c7                	mov    %eax,%edi
  1042fb:	e8 a0 ce ff ff       	call   1011a0 <time_get>
  104300:	89 c6                	mov    %eax,%esi
  104302:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  104309:	e8 92 ce ff ff       	call   1011a0 <time_get>
  10430e:	57                   	push   %edi
  10430f:	56                   	push   %esi
  104310:	50                   	push   %eax
  104311:	68 06 61 10 00       	push   $0x106106
  104316:	e8 d5 c3 ff ff       	call   1006f0 <kprintf>
  10431b:	83 c4 20             	add    $0x20,%esp
  10431e:	84 db                	test   %bl,%bl
  104320:	0f 85 f3 00 00 00    	jne    104419 <main+0x309>
  104326:	53                   	push   %ebx
  104327:	53                   	push   %ebx
  104328:	68 1e 62 10 00       	push   $0x10621e
  10432d:	68 d8 61 10 00       	push   $0x1061d8
  104332:	e8 b9 c3 ff ff       	call   1006f0 <kprintf>
  104337:	83 c4 10             	add    $0x10,%esp
    INSTALL(syscall);
  10433a:	e8 f1 cd ff ff       	call   101130 <install_syscall>
  10433f:	83 ec 0c             	sub    $0xc,%esp
  104342:	89 c3                	mov    %eax,%ebx
  104344:	6a 00                	push   $0x0
  104346:	e8 55 ce ff ff       	call   1011a0 <time_get>
  10434b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  104352:	89 c7                	mov    %eax,%edi
  104354:	e8 47 ce ff ff       	call   1011a0 <time_get>
  104359:	89 c6                	mov    %eax,%esi
  10435b:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  104362:	e8 39 ce ff ff       	call   1011a0 <time_get>
  104367:	57                   	push   %edi
  104368:	56                   	push   %esi
  104369:	50                   	push   %eax
  10436a:	68 06 61 10 00       	push   $0x106106
  10436f:	e8 7c c3 ff ff       	call   1006f0 <kprintf>
  104374:	83 c4 20             	add    $0x20,%esp
  104377:	84 db                	test   %bl,%bl
  104379:	0f 84 17 01 00 00    	je     104496 <main+0x386>
  10437f:	50                   	push   %eax
  104380:	50                   	push   %eax
  104381:	68 27 62 10 00       	push   $0x106227
  104386:	68 ee 61 10 00       	push   $0x1061ee
  10438b:	e8 60 c3 ff ff       	call   1006f0 <kprintf>
  104390:	83 c4 10             	add    $0x10,%esp
    
    INFO("Interrupt enabled!"); sti();
  104393:	83 ec 04             	sub    $0x4,%esp
  104396:	68 2f 62 10 00       	push   $0x10622f
  10439b:	68 44 51 10 00       	push   $0x105144
  1043a0:	6a 00                	push   $0x0
  1043a2:	e8 29 c9 ff ff       	call   100cd0 <__log>
  asm volatile("sti");
  1043a7:	fb                   	sti    

    INFO("&fcore&9ONE &7v0.0.1 - \"Everything went well.\"");
  1043a8:	83 c4 0c             	add    $0xc,%esp
  1043ab:	68 8c 54 10 00       	push   $0x10548c
  1043b0:	68 44 51 10 00       	push   $0x105144
  1043b5:	6a 00                	push   $0x0
  1043b7:	e8 14 c9 ff ff       	call   100cd0 <__log>
    // {
    //     /* code */
    //     kprintf("working %x...\r", i);
    // }

    INFO("Entering user mode...");
  1043bc:	83 c4 0c             	add    $0xc,%esp
  1043bf:	68 42 62 10 00       	push   $0x106242
  1043c4:	68 44 51 10 00       	push   $0x105144
  1043c9:	6a 00                	push   $0x0
  1043cb:	e8 00 c9 ff ff       	call   100cd0 <__log>

    asm("mov $0x01, %eax; int $0x30");
  1043d0:	b8 01 00 00 00       	mov    $0x1,%eax
  1043d5:	cd 30                	int    $0x30
            movw %%ax, %%ds \n \
            iret" : "=m" (default_tss.esp0) : );*/


    // for(;;){}    
    PANIC("The end of the main function has been reached.");
  1043d7:	c7 04 24 bc 54 10 00 	movl   $0x1054bc,(%esp)
  1043de:	6a 47                	push   $0x47
  1043e0:	68 44 51 10 00       	push   $0x105144
  1043e5:	68 58 62 10 00       	push   $0x106258
  1043ea:	6a 00                	push   $0x0
  1043ec:	e8 af c9 ff ff       	call   100da0 <__panic>
}
  1043f1:	83 c4 20             	add    $0x20,%esp
  1043f4:	8d 65 f0             	lea    -0x10(%ebp),%esp
  1043f7:	59                   	pop    %ecx
  1043f8:	5b                   	pop    %ebx
  1043f9:	5e                   	pop    %esi
  1043fa:	5f                   	pop    %edi
  1043fb:	5d                   	pop    %ebp
  1043fc:	8d 61 fc             	lea    -0x4(%ecx),%esp
  1043ff:	c3                   	ret    
    INSTALL(console);
  104400:	52                   	push   %edx
  104401:	52                   	push   %edx
  104402:	68 d0 61 10 00       	push   $0x1061d0
  104407:	68 ee 61 10 00       	push   $0x1061ee
  10440c:	e8 df c2 ff ff       	call   1006f0 <kprintf>
  104411:	83 c4 10             	add    $0x10,%esp
  104414:	e9 64 fd ff ff       	jmp    10417d <main+0x6d>
    INSTALL(keyboard);
  104419:	51                   	push   %ecx
  10441a:	51                   	push   %ecx
  10441b:	68 1e 62 10 00       	push   $0x10621e
  104420:	68 ee 61 10 00       	push   $0x1061ee
  104425:	e8 c6 c2 ff ff       	call   1006f0 <kprintf>
  10442a:	83 c4 10             	add    $0x10,%esp
  10442d:	e9 08 ff ff ff       	jmp    10433a <main+0x22a>
    INSTALL(clock);
  104432:	56                   	push   %esi
  104433:	56                   	push   %esi
  104434:	68 18 62 10 00       	push   $0x106218
  104439:	68 ee 61 10 00       	push   $0x1061ee
  10443e:	e8 ad c2 ff ff       	call   1006f0 <kprintf>
  104443:	83 c4 10             	add    $0x10,%esp
  104446:	e9 96 fe ff ff       	jmp    1042e1 <main+0x1d1>
    INSTALL(interrupts);
  10444b:	50                   	push   %eax
  10444c:	50                   	push   %eax
  10444d:	68 0d 62 10 00       	push   $0x10620d
  104452:	68 ee 61 10 00       	push   $0x1061ee
  104457:	e8 94 c2 ff ff       	call   1006f0 <kprintf>
  10445c:	83 c4 10             	add    $0x10,%esp
  10445f:	e9 24 fe ff ff       	jmp    104288 <main+0x178>
    INSTALL(gdt);
  104464:	50                   	push   %eax
  104465:	50                   	push   %eax
  104466:	68 09 62 10 00       	push   $0x106209
  10446b:	68 ee 61 10 00       	push   $0x1061ee
  104470:	e8 7b c2 ff ff       	call   1006f0 <kprintf>
  104475:	83 c4 10             	add    $0x10,%esp
  104478:	e9 b2 fd ff ff       	jmp    10422f <main+0x11f>
    INSTALL(uart);
  10447d:	50                   	push   %eax
  10447e:	50                   	push   %eax
  10447f:	68 04 62 10 00       	push   $0x106204
  104484:	68 ee 61 10 00       	push   $0x1061ee
  104489:	e8 62 c2 ff ff       	call   1006f0 <kprintf>
  10448e:	83 c4 10             	add    $0x10,%esp
  104491:	e9 40 fd ff ff       	jmp    1041d6 <main+0xc6>
    INSTALL(syscall);
  104496:	52                   	push   %edx
  104497:	52                   	push   %edx
  104498:	68 27 62 10 00       	push   $0x106227
  10449d:	68 d8 61 10 00       	push   $0x1061d8
  1044a2:	e8 49 c2 ff ff       	call   1006f0 <kprintf>
  1044a7:	83 c4 10             	add    $0x10,%esp
  1044aa:	e9 e4 fe ff ff       	jmp    104393 <main+0x283>
