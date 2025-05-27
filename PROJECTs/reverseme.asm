
reverseme:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:	53                   	push   ebx
    1001:	83 ec 08             	sub    esp,0x8
    1004:	e8 b7 00 00 00       	call   10c0 <__x86.get_pc_thunk.bx>
    1009:	81 c3 eb 2f 00 00    	add    ebx,0x2feb
    100f:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
    1015:	85 c0                	test   eax,eax
    1017:	74 02                	je     101b <_init+0x1b>
    1019:	ff d0                	call   eax
    101b:	83 c4 08             	add    esp,0x8
    101e:	5b                   	pop    ebx
    101f:	c3                   	ret

Disassembly of section .plt:

00001020 <__libc_start_main@plt-0x10>:
    1020:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
    1026:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
    102c:	00 00                	add    BYTE PTR [eax],al
	...

00001030 <__libc_start_main@plt>:
    1030:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

00001040 <printf@plt>:
    1040:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
    1046:	68 08 00 00 00       	push   0x8
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

00001050 <puts@plt>:
    1050:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
    1056:	68 10 00 00 00       	push   0x10
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

00001060 <strlen@plt>:
    1060:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
    1066:	68 18 00 00 00       	push   0x18
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

00001070 <__isoc99_scanf@plt>:
    1070:	ff a3 1c 00 00 00    	jmp    DWORD PTR [ebx+0x1c]
    1076:	68 20 00 00 00       	push   0x20
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00001080 <__cxa_finalize@plt>:
    1080:	ff a3 f0 ff ff ff    	jmp    DWORD PTR [ebx-0x10]
    1086:	66 90                	xchg   ax,ax

Disassembly of section .text:

00001090 <_start>:
    1090:	31 ed                	xor    ebp,ebp
    1092:	5e                   	pop    esi
    1093:	89 e1                	mov    ecx,esp
    1095:	83 e4 f0             	and    esp,0xfffffff0
    1098:	50                   	push   eax
    1099:	54                   	push   esp
    109a:	52                   	push   edx
    109b:	e8 18 00 00 00       	call   10b8 <_start+0x28>
    10a0:	81 c3 54 2f 00 00    	add    ebx,0x2f54
    10a6:	6a 00                	push   0x0
    10a8:	6a 00                	push   0x0
    10aa:	51                   	push   ecx
    10ab:	56                   	push   esi
    10ac:	ff b3 f8 ff ff ff    	push   DWORD PTR [ebx-0x8]
    10b2:	e8 79 ff ff ff       	call   1030 <__libc_start_main@plt>
    10b7:	f4                   	hlt
    10b8:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10bb:	c3                   	ret
    10bc:	66 90                	xchg   ax,ax
    10be:	66 90                	xchg   ax,ax

000010c0 <__x86.get_pc_thunk.bx>:
    10c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10c3:	c3                   	ret
    10c4:	66 90                	xchg   ax,ax
    10c6:	66 90                	xchg   ax,ax
    10c8:	66 90                	xchg   ax,ax
    10ca:	66 90                	xchg   ax,ax
    10cc:	66 90                	xchg   ax,ax
    10ce:	66 90                	xchg   ax,ax

000010d0 <deregister_tm_clones>:
    10d0:	e8 e4 00 00 00       	call   11b9 <__x86.get_pc_thunk.dx>
    10d5:	81 c2 1f 2f 00 00    	add    edx,0x2f1f
    10db:	8d 8a 28 00 00 00    	lea    ecx,[edx+0x28]
    10e1:	8d 82 28 00 00 00    	lea    eax,[edx+0x28]
    10e7:	39 c8                	cmp    eax,ecx
    10e9:	74 1d                	je     1108 <deregister_tm_clones+0x38>
    10eb:	8b 82 ec ff ff ff    	mov    eax,DWORD PTR [edx-0x14]
    10f1:	85 c0                	test   eax,eax
    10f3:	74 13                	je     1108 <deregister_tm_clones+0x38>
    10f5:	55                   	push   ebp
    10f6:	89 e5                	mov    ebp,esp
    10f8:	83 ec 14             	sub    esp,0x14
    10fb:	51                   	push   ecx
    10fc:	ff d0                	call   eax
    10fe:	83 c4 10             	add    esp,0x10
    1101:	c9                   	leave
    1102:	c3                   	ret
    1103:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]
    1108:	c3                   	ret
    1109:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00001110 <register_tm_clones>:
    1110:	e8 a4 00 00 00       	call   11b9 <__x86.get_pc_thunk.dx>
    1115:	81 c2 df 2e 00 00    	add    edx,0x2edf
    111b:	55                   	push   ebp
    111c:	89 e5                	mov    ebp,esp
    111e:	53                   	push   ebx
    111f:	8d 8a 28 00 00 00    	lea    ecx,[edx+0x28]
    1125:	8d 82 28 00 00 00    	lea    eax,[edx+0x28]
    112b:	83 ec 04             	sub    esp,0x4
    112e:	29 c8                	sub    eax,ecx
    1130:	89 c3                	mov    ebx,eax
    1132:	c1 e8 1f             	shr    eax,0x1f
    1135:	c1 fb 02             	sar    ebx,0x2
    1138:	01 d8                	add    eax,ebx
    113a:	d1 f8                	sar    eax,1
    113c:	74 14                	je     1152 <register_tm_clones+0x42>
    113e:	8b 92 fc ff ff ff    	mov    edx,DWORD PTR [edx-0x4]
    1144:	85 d2                	test   edx,edx
    1146:	74 0a                	je     1152 <register_tm_clones+0x42>
    1148:	83 ec 08             	sub    esp,0x8
    114b:	50                   	push   eax
    114c:	51                   	push   ecx
    114d:	ff d2                	call   edx
    114f:	83 c4 10             	add    esp,0x10
    1152:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1155:	c9                   	leave
    1156:	c3                   	ret
    1157:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
    115e:	00 
    115f:	90                   	nop

00001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fb          	endbr32
    1164:	55                   	push   ebp
    1165:	89 e5                	mov    ebp,esp
    1167:	53                   	push   ebx
    1168:	e8 53 ff ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    116d:	81 c3 87 2e 00 00    	add    ebx,0x2e87
    1173:	83 ec 04             	sub    esp,0x4
    1176:	80 bb 28 00 00 00 00 	cmp    BYTE PTR [ebx+0x28],0x0
    117d:	75 27                	jne    11a6 <__do_global_dtors_aux+0x46>
    117f:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
    1185:	85 c0                	test   eax,eax
    1187:	74 11                	je     119a <__do_global_dtors_aux+0x3a>
    1189:	83 ec 0c             	sub    esp,0xc
    118c:	ff b3 24 00 00 00    	push   DWORD PTR [ebx+0x24]
    1192:	e8 e9 fe ff ff       	call   1080 <__cxa_finalize@plt>
    1197:	83 c4 10             	add    esp,0x10
    119a:	e8 31 ff ff ff       	call   10d0 <deregister_tm_clones>
    119f:	c6 83 28 00 00 00 01 	mov    BYTE PTR [ebx+0x28],0x1
    11a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    11a9:	c9                   	leave
    11aa:	c3                   	ret
    11ab:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]

000011b0 <frame_dummy>:
    11b0:	f3 0f 1e fb          	endbr32
    11b4:	e9 57 ff ff ff       	jmp    1110 <register_tm_clones>

000011b9 <__x86.get_pc_thunk.dx>:
    11b9:	8b 14 24             	mov    edx,DWORD PTR [esp]
    11bc:	c3                   	ret

000011bd <main>:
    11bd:	8d 4c 24 04          	lea    ecx,[esp+0x4]
    11c1:	83 e4 f0             	and    esp,0xfffffff0
    11c4:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
    11c7:	55                   	push   ebp
    11c8:	89 e5                	mov    ebp,esp
    11ca:	56                   	push   esi
    11cb:	53                   	push   ebx
    11cc:	51                   	push   ecx
    11cd:	83 ec 3c             	sub    esp,0x3c
    11d0:	e8 eb fe ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    11d5:	81 c3 1f 2e 00 00    	add    ebx,0x2e1f
    11db:	c6 45 df c7          	mov    BYTE PTR [ebp-0x21],0xc7
    11df:	c6 45 de c6          	mov    BYTE PTR [ebp-0x22],0xc6
    11e3:	c6 45 dd c6          	mov    BYTE PTR [ebp-0x23],0xc6
    11e7:	c6 45 dc d3          	mov    BYTE PTR [ebp-0x24],0xd3
    11eb:	c6 45 db c5          	mov    BYTE PTR [ebp-0x25],0xc5
    11ef:	c6 45 da cf          	mov    BYTE PTR [ebp-0x26],0xcf
    11f3:	c6 45 d9 cc          	mov    BYTE PTR [ebp-0x27],0xcc
    11f7:	c6 45 d8 d4          	mov    BYTE PTR [ebp-0x28],0xd4
    11fb:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    11ff:	83 f0 a3             	xor    eax,0xffffffa3
    1202:	88 45 bc             	mov    BYTE PTR [ebp-0x44],al
    1205:	0f b6 45 de          	movzx  eax,BYTE PTR [ebp-0x22]
    1209:	83 f0 a3             	xor    eax,0xffffffa3
    120c:	88 45 bd             	mov    BYTE PTR [ebp-0x43],al
    120f:	0f b6 45 dd          	movzx  eax,BYTE PTR [ebp-0x23]
    1213:	83 f0 a3             	xor    eax,0xffffffa3
    1216:	88 45 be             	mov    BYTE PTR [ebp-0x42],al
    1219:	0f b6 45 dc          	movzx  eax,BYTE PTR [ebp-0x24]
    121d:	83 f0 a3             	xor    eax,0xffffffa3
    1220:	88 45 bf             	mov    BYTE PTR [ebp-0x41],al
    1223:	0f b6 45 db          	movzx  eax,BYTE PTR [ebp-0x25]
    1227:	83 f0 a3             	xor    eax,0xffffffa3
    122a:	88 45 c0             	mov    BYTE PTR [ebp-0x40],al
    122d:	0f b6 45 da          	movzx  eax,BYTE PTR [ebp-0x26]
    1231:	83 f0 a3             	xor    eax,0xffffffa3
    1234:	88 45 c1             	mov    BYTE PTR [ebp-0x3f],al
    1237:	0f b6 45 d9          	movzx  eax,BYTE PTR [ebp-0x27]
    123b:	83 f0 a3             	xor    eax,0xffffffa3
    123e:	88 45 c2             	mov    BYTE PTR [ebp-0x3e],al
    1241:	0f b6 45 d8          	movzx  eax,BYTE PTR [ebp-0x28]
    1245:	83 f0 a3             	xor    eax,0xffffffa3
    1248:	88 45 c3             	mov    BYTE PTR [ebp-0x3d],al
    124b:	83 ec 0c             	sub    esp,0xc
    124e:	8d 83 14 e0 ff ff    	lea    eax,[ebx-0x1fec]
    1254:	50                   	push   eax
    1255:	e8 e6 fd ff ff       	call   1040 <printf@plt>
    125a:	83 c4 10             	add    esp,0x10
    125d:	83 ec 08             	sub    esp,0x8
    1260:	8d 45 ce             	lea    eax,[ebp-0x32]
    1263:	50                   	push   eax
    1264:	8d 83 29 e0 ff ff    	lea    eax,[ebx-0x1fd7]
    126a:	50                   	push   eax
    126b:	e8 00 fe ff ff       	call   1070 <__isoc99_scanf@plt>
    1270:	83 c4 10             	add    esp,0x10
    1273:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
    127a:	eb 19                	jmp    1295 <main+0xd8>
    127c:	8d 55 bc             	lea    edx,[ebp-0x44]
    127f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1282:	01 d0                	add    eax,edx
    1284:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1287:	8d 4d c4             	lea    ecx,[ebp-0x3c]
    128a:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    128d:	01 ca                	add    edx,ecx
    128f:	88 02                	mov    BYTE PTR [edx],al
    1291:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    1295:	83 7d e4 07          	cmp    DWORD PTR [ebp-0x1c],0x7
    1299:	76 e1                	jbe    127c <main+0xbf>
    129b:	c6 45 cc 00          	mov    BYTE PTR [ebp-0x34],0x0
    129f:	83 ec 0c             	sub    esp,0xc
    12a2:	8d 45 ce             	lea    eax,[ebp-0x32]
    12a5:	50                   	push   eax
    12a6:	e8 b5 fd ff ff       	call   1060 <strlen@plt>
    12ab:	83 c4 10             	add    esp,0x10
    12ae:	89 c6                	mov    esi,eax
    12b0:	83 ec 0c             	sub    esp,0xc
    12b3:	8d 45 c4             	lea    eax,[ebp-0x3c]
    12b6:	50                   	push   eax
    12b7:	e8 a4 fd ff ff       	call   1060 <strlen@plt>
    12bc:	83 c4 10             	add    esp,0x10
    12bf:	39 c6                	cmp    esi,eax
    12c1:	74 19                	je     12dc <main+0x11f>
    12c3:	83 ec 0c             	sub    esp,0xc
    12c6:	8d 83 30 e0 ff ff    	lea    eax,[ebx-0x1fd0]
    12cc:	50                   	push   eax
    12cd:	e8 7e fd ff ff       	call   1050 <puts@plt>
    12d2:	83 c4 10             	add    esp,0x10
    12d5:	b8 01 00 00 00       	mov    eax,0x1
    12da:	eb 6c                	jmp    1348 <main+0x18b>
    12dc:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
    12e3:	eb 37                	jmp    131c <main+0x15f>
    12e5:	8d 55 ce             	lea    edx,[ebp-0x32]
    12e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    12eb:	01 d0                	add    eax,edx
    12ed:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    12f0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
    12f3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    12f6:	01 c8                	add    eax,ecx
    12f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    12fb:	38 c2                	cmp    dl,al
    12fd:	74 19                	je     1318 <main+0x15b>
    12ff:	83 ec 0c             	sub    esp,0xc
    1302:	8d 83 30 e0 ff ff    	lea    eax,[ebx-0x1fd0]
    1308:	50                   	push   eax
    1309:	e8 42 fd ff ff       	call   1050 <puts@plt>
    130e:	83 c4 10             	add    esp,0x10
    1311:	b8 01 00 00 00       	mov    eax,0x1
    1316:	eb 30                	jmp    1348 <main+0x18b>
    1318:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    131c:	83 7d e0 07          	cmp    DWORD PTR [ebp-0x20],0x7
    1320:	76 c3                	jbe    12e5 <main+0x128>
    1322:	83 ec 0c             	sub    esp,0xc
    1325:	8d 45 ce             	lea    eax,[ebp-0x32]
    1328:	50                   	push   eax
    1329:	e8 22 fd ff ff       	call   1050 <puts@plt>
    132e:	83 c4 10             	add    esp,0x10
    1331:	83 ec 0c             	sub    esp,0xc
    1334:	8d 83 50 e0 ff ff    	lea    eax,[ebx-0x1fb0]
    133a:	50                   	push   eax
    133b:	e8 10 fd ff ff       	call   1050 <puts@plt>
    1340:	83 c4 10             	add    esp,0x10
    1343:	b8 00 00 00 00       	mov    eax,0x0
    1348:	8d 65 f4             	lea    esp,[ebp-0xc]
    134b:	59                   	pop    ecx
    134c:	5b                   	pop    ebx
    134d:	5e                   	pop    esi
    134e:	5d                   	pop    ebp
    134f:	8d 61 fc             	lea    esp,[ecx-0x4]
    1352:	c3                   	ret

Disassembly of section .fini:

00001354 <_fini>:
    1354:	53                   	push   ebx
    1355:	83 ec 08             	sub    esp,0x8
    1358:	e8 63 fd ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    135d:	81 c3 97 2c 00 00    	add    ebx,0x2c97
    1363:	83 c4 08             	add    esp,0x8
    1366:	5b                   	pop    ebx
    1367:	c3                   	ret
