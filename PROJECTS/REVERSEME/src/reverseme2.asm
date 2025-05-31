
reverseme2:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:	53                   	push   ebx
    1001:	83 ec 08             	sub    esp,0x8
    1004:	e8 e7 00 00 00       	call   10f0 <__x86.get_pc_thunk.bx>
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

00001050 <perror@plt>:
    1050:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
    1056:	68 10 00 00 00       	push   0x10
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

00001060 <puts@plt>:
    1060:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
    1066:	68 18 00 00 00       	push   0x18
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

00001070 <exit@plt>:
    1070:	ff a3 1c 00 00 00    	jmp    DWORD PTR [ebx+0x1c]
    1076:	68 20 00 00 00       	push   0x20
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

00001080 <mmap@plt>:
    1080:	ff a3 20 00 00 00    	jmp    DWORD PTR [ebx+0x20]
    1086:	68 28 00 00 00       	push   0x28
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

00001090 <strlen@plt>:
    1090:	ff a3 24 00 00 00    	jmp    DWORD PTR [ebx+0x24]
    1096:	68 30 00 00 00       	push   0x30
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

000010a0 <__isoc99_scanf@plt>:
    10a0:	ff a3 28 00 00 00    	jmp    DWORD PTR [ebx+0x28]
    10a6:	68 38 00 00 00       	push   0x38
    10ab:	e9 70 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

000010b0 <__cxa_finalize@plt>:
    10b0:	ff a3 f0 ff ff ff    	jmp    DWORD PTR [ebx-0x10]
    10b6:	66 90                	xchg   ax,ax

Disassembly of section .text:

000010c0 <_start>:
    10c0:	31 ed                	xor    ebp,ebp
    10c2:	5e                   	pop    esi
    10c3:	89 e1                	mov    ecx,esp
    10c5:	83 e4 f0             	and    esp,0xfffffff0
    10c8:	50                   	push   eax
    10c9:	54                   	push   esp
    10ca:	52                   	push   edx
    10cb:	e8 18 00 00 00       	call   10e8 <_start+0x28>
    10d0:	81 c3 24 2f 00 00    	add    ebx,0x2f24
    10d6:	6a 00                	push   0x0
    10d8:	6a 00                	push   0x0
    10da:	51                   	push   ecx
    10db:	56                   	push   esi
    10dc:	ff b3 f8 ff ff ff    	push   DWORD PTR [ebx-0x8]
    10e2:	e8 49 ff ff ff       	call   1030 <__libc_start_main@plt>
    10e7:	f4                   	hlt
    10e8:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10eb:	c3                   	ret
    10ec:	66 90                	xchg   ax,ax
    10ee:	66 90                	xchg   ax,ax

000010f0 <__x86.get_pc_thunk.bx>:
    10f0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10f3:	c3                   	ret
    10f4:	66 90                	xchg   ax,ax
    10f6:	66 90                	xchg   ax,ax
    10f8:	66 90                	xchg   ax,ax
    10fa:	66 90                	xchg   ax,ax
    10fc:	66 90                	xchg   ax,ax
    10fe:	66 90                	xchg   ax,ax

00001100 <deregister_tm_clones>:
    1100:	e8 e4 00 00 00       	call   11e9 <__x86.get_pc_thunk.dx>
    1105:	81 c2 ef 2e 00 00    	add    edx,0x2eef
    110b:	8d 8a 34 00 00 00    	lea    ecx,[edx+0x34]
    1111:	8d 82 34 00 00 00    	lea    eax,[edx+0x34]
    1117:	39 c8                	cmp    eax,ecx
    1119:	74 1d                	je     1138 <deregister_tm_clones+0x38>
    111b:	8b 82 ec ff ff ff    	mov    eax,DWORD PTR [edx-0x14]
    1121:	85 c0                	test   eax,eax
    1123:	74 13                	je     1138 <deregister_tm_clones+0x38>
    1125:	55                   	push   ebp
    1126:	89 e5                	mov    ebp,esp
    1128:	83 ec 14             	sub    esp,0x14
    112b:	51                   	push   ecx
    112c:	ff d0                	call   eax
    112e:	83 c4 10             	add    esp,0x10
    1131:	c9                   	leave
    1132:	c3                   	ret
    1133:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]
    1138:	c3                   	ret
    1139:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00001140 <register_tm_clones>:
    1140:	e8 a4 00 00 00       	call   11e9 <__x86.get_pc_thunk.dx>
    1145:	81 c2 af 2e 00 00    	add    edx,0x2eaf
    114b:	55                   	push   ebp
    114c:	89 e5                	mov    ebp,esp
    114e:	53                   	push   ebx
    114f:	8d 8a 34 00 00 00    	lea    ecx,[edx+0x34]
    1155:	8d 82 34 00 00 00    	lea    eax,[edx+0x34]
    115b:	83 ec 04             	sub    esp,0x4
    115e:	29 c8                	sub    eax,ecx
    1160:	89 c3                	mov    ebx,eax
    1162:	c1 e8 1f             	shr    eax,0x1f
    1165:	c1 fb 02             	sar    ebx,0x2
    1168:	01 d8                	add    eax,ebx
    116a:	d1 f8                	sar    eax,1
    116c:	74 14                	je     1182 <register_tm_clones+0x42>
    116e:	8b 92 fc ff ff ff    	mov    edx,DWORD PTR [edx-0x4]
    1174:	85 d2                	test   edx,edx
    1176:	74 0a                	je     1182 <register_tm_clones+0x42>
    1178:	83 ec 08             	sub    esp,0x8
    117b:	50                   	push   eax
    117c:	51                   	push   ecx
    117d:	ff d2                	call   edx
    117f:	83 c4 10             	add    esp,0x10
    1182:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1185:	c9                   	leave
    1186:	c3                   	ret
    1187:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
    118e:	00 
    118f:	90                   	nop

00001190 <__do_global_dtors_aux>:
    1190:	f3 0f 1e fb          	endbr32
    1194:	55                   	push   ebp
    1195:	89 e5                	mov    ebp,esp
    1197:	53                   	push   ebx
    1198:	e8 53 ff ff ff       	call   10f0 <__x86.get_pc_thunk.bx>
    119d:	81 c3 57 2e 00 00    	add    ebx,0x2e57
    11a3:	83 ec 04             	sub    esp,0x4
    11a6:	80 bb 34 00 00 00 00 	cmp    BYTE PTR [ebx+0x34],0x0
    11ad:	75 27                	jne    11d6 <__do_global_dtors_aux+0x46>
    11af:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
    11b5:	85 c0                	test   eax,eax
    11b7:	74 11                	je     11ca <__do_global_dtors_aux+0x3a>
    11b9:	83 ec 0c             	sub    esp,0xc
    11bc:	ff b3 30 00 00 00    	push   DWORD PTR [ebx+0x30]
    11c2:	e8 e9 fe ff ff       	call   10b0 <__cxa_finalize@plt>
    11c7:	83 c4 10             	add    esp,0x10
    11ca:	e8 31 ff ff ff       	call   1100 <deregister_tm_clones>
    11cf:	c6 83 34 00 00 00 01 	mov    BYTE PTR [ebx+0x34],0x1
    11d6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    11d9:	c9                   	leave
    11da:	c3                   	ret
    11db:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]

000011e0 <frame_dummy>:
    11e0:	f3 0f 1e fb          	endbr32
    11e4:	e9 57 ff ff ff       	jmp    1140 <register_tm_clones>

000011e9 <__x86.get_pc_thunk.dx>:
    11e9:	8b 14 24             	mov    edx,DWORD PTR [esp]
    11ec:	c3                   	ret

000011ed <pwdcheck>:
    11ed:	55                   	push   ebp
    11ee:	89 e5                	mov    ebp,esp
    11f0:	83 ec 10             	sub    esp,0x10
    11f3:	e8 13 02 00 00       	call   140b <__x86.get_pc_thunk.ax>
    11f8:	05 fc 2d 00 00       	add    eax,0x2dfc
    11fd:	c7 45 f4 64 65 65 70 	mov    DWORD PTR [ebp-0xc],0x70656564
    1204:	c7 45 f8 66 6c 6f 77 	mov    DWORD PTR [ebp-0x8],0x776f6c66
    120b:	83 7d 0c 08          	cmp    DWORD PTR [ebp+0xc],0x8
    120f:	74 07                	je     1218 <pwdcheck+0x2b>
    1211:	b8 00 00 00 00       	mov    eax,0x0
    1216:	eb 39                	jmp    1251 <pwdcheck+0x64>
    1218:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
    121f:	eb 25                	jmp    1246 <pwdcheck+0x59>
    1221:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    1224:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1227:	01 d0                	add    eax,edx
    1229:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    122c:	8d 4d f4             	lea    ecx,[ebp-0xc]
    122f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    1232:	01 c8                	add    eax,ecx
    1234:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1237:	38 c2                	cmp    dl,al
    1239:	74 07                	je     1242 <pwdcheck+0x55>
    123b:	b8 00 00 00 00       	mov    eax,0x0
    1240:	eb 0f                	jmp    1251 <pwdcheck+0x64>
    1242:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
    1246:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
    124a:	7e d5                	jle    1221 <pwdcheck+0x34>
    124c:	b8 01 00 00 00       	mov    eax,0x1
    1251:	c9                   	leave
    1252:	c3                   	ret

00001253 <main>:
    1253:	8d 4c 24 04          	lea    ecx,[esp+0x4]
    1257:	83 e4 f0             	and    esp,0xfffffff0
    125a:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
    125d:	55                   	push   ebp
    125e:	89 e5                	mov    ebp,esp
    1260:	57                   	push   edi
    1261:	56                   	push   esi
    1262:	53                   	push   ebx
    1263:	51                   	push   ecx
    1264:	81 ec b8 00 00 00    	sub    esp,0xb8
    126a:	e8 81 fe ff ff       	call   10f0 <__x86.get_pc_thunk.bx>
    126f:	81 c3 85 2d 00 00    	add    ebx,0x2d85
    1275:	8d 8d 46 ff ff ff    	lea    ecx,[ebp-0xba]
    127b:	8d 83 a0 e0 ff ff    	lea    eax,[ebx-0x1f60]
    1281:	ba 8e 00 00 00       	mov    edx,0x8e
    1286:	8b 30                	mov    esi,DWORD PTR [eax]
    1288:	89 31                	mov    DWORD PTR [ecx],esi
    128a:	8b 74 10 fc          	mov    esi,DWORD PTR [eax+edx*1-0x4]
    128e:	89 74 11 fc          	mov    DWORD PTR [ecx+edx*1-0x4],esi
    1292:	8d 79 04             	lea    edi,[ecx+0x4]
    1295:	83 e7 fc             	and    edi,0xfffffffc
    1298:	29 f9                	sub    ecx,edi
    129a:	29 c8                	sub    eax,ecx
    129c:	01 ca                	add    edx,ecx
    129e:	83 e2 fc             	and    edx,0xfffffffc
    12a1:	c1 ea 02             	shr    edx,0x2
    12a4:	89 c6                	mov    esi,eax
    12a6:	89 d1                	mov    ecx,edx
    12a8:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
    12aa:	c7 45 e4 00 01 00 00 	mov    DWORD PTR [ebp-0x1c],0x100
    12b1:	83 ec 08             	sub    esp,0x8
    12b4:	6a 00                	push   0x0
    12b6:	6a ff                	push   0xffffffff
    12b8:	6a 22                	push   0x22
    12ba:	6a 07                	push   0x7
    12bc:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    12bf:	6a 00                	push   0x0
    12c1:	e8 ba fd ff ff       	call   1080 <mmap@plt>
    12c6:	83 c4 20             	add    esp,0x20
    12c9:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
    12cc:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
    12d0:	75 1c                	jne    12ee <main+0x9b>
    12d2:	83 ec 0c             	sub    esp,0xc
    12d5:	8d 83 14 e0 ff ff    	lea    eax,[ebx-0x1fec]
    12db:	50                   	push   eax
    12dc:	e8 6f fd ff ff       	call   1050 <perror@plt>
    12e1:	83 c4 10             	add    esp,0x10
    12e4:	83 ec 0c             	sub    esp,0xc
    12e7:	6a 01                	push   0x1
    12e9:	e8 82 fd ff ff       	call   1070 <exit@plt>
    12ee:	83 ec 08             	sub    esp,0x8
    12f1:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
    12f4:	8d 83 19 e0 ff ff    	lea    eax,[ebx-0x1fe7]
    12fa:	50                   	push   eax
    12fb:	e8 40 fd ff ff       	call   1040 <printf@plt>
    1300:	83 c4 10             	add    esp,0x10
    1303:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    130a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    130d:	89 c1                	mov    ecx,eax
    130f:	8d 85 46 ff ff ff    	lea    eax,[ebp-0xba]
    1315:	ba 8e 00 00 00       	mov    edx,0x8e
    131a:	8b 30                	mov    esi,DWORD PTR [eax]
    131c:	89 31                	mov    DWORD PTR [ecx],esi
    131e:	8b 74 10 fc          	mov    esi,DWORD PTR [eax+edx*1-0x4]
    1322:	89 74 11 fc          	mov    DWORD PTR [ecx+edx*1-0x4],esi
    1326:	8d 79 04             	lea    edi,[ecx+0x4]
    1329:	83 e7 fc             	and    edi,0xfffffffc
    132c:	29 f9                	sub    ecx,edi
    132e:	29 c8                	sub    eax,ecx
    1330:	01 ca                	add    edx,ecx
    1332:	83 e2 fc             	and    edx,0xfffffffc
    1335:	c1 ea 02             	shr    edx,0x2
    1338:	89 c6                	mov    esi,eax
    133a:	89 d1                	mov    ecx,edx
    133c:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
    133e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1341:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
    1344:	83 ec 0c             	sub    esp,0xc
    1347:	8d 83 2f e0 ff ff    	lea    eax,[ebx-0x1fd1]
    134d:	50                   	push   eax
    134e:	e8 ed fc ff ff       	call   1040 <printf@plt>
    1353:	83 c4 10             	add    esp,0x10
    1356:	83 ec 08             	sub    esp,0x8
    1359:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
    135f:	50                   	push   eax
    1360:	8d 83 44 e0 ff ff    	lea    eax,[ebx-0x1fbc]
    1366:	50                   	push   eax
    1367:	e8 34 fd ff ff       	call   10a0 <__isoc99_scanf@plt>
    136c:	83 c4 10             	add    esp,0x10
    136f:	83 ec 0c             	sub    esp,0xc
    1372:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
    1378:	50                   	push   eax
    1379:	e8 12 fd ff ff       	call   1090 <strlen@plt>
    137e:	83 c4 10             	add    esp,0x10
    1381:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
    1384:	83 ec 08             	sub    esp,0x8
    1387:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
    138a:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
    1390:	50                   	push   eax
    1391:	e8 57 fe ff ff       	call   11ed <pwdcheck>
    1396:	83 c4 10             	add    esp,0x10
    1399:	85 c0                	test   eax,eax
    139b:	74 4b                	je     13e8 <main+0x195>
    139d:	83 ec 04             	sub    esp,0x4
    13a0:	8d 83 f9 d1 ff ff    	lea    eax,[ebx-0x2e07]
    13a6:	50                   	push   eax
    13a7:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
    13ad:	50                   	push   eax
    13ae:	8d 83 49 e0 ff ff    	lea    eax,[ebx-0x1fb7]
    13b4:	50                   	push   eax
    13b5:	e8 86 fc ff ff       	call   1040 <printf@plt>
    13ba:	83 c4 10             	add    esp,0x10
    13bd:	83 ec 0c             	sub    esp,0xc
    13c0:	8d 83 50 e0 ff ff    	lea    eax,[ebx-0x1fb0]
    13c6:	50                   	push   eax
    13c7:	e8 94 fc ff ff       	call   1060 <puts@plt>
    13cc:	83 c4 10             	add    esp,0x10
    13cf:	83 ec 0c             	sub    esp,0xc
    13d2:	8d 83 93 e0 ff ff    	lea    eax,[ebx-0x1f6d]
    13d8:	50                   	push   eax
    13d9:	e8 82 fc ff ff       	call   1060 <puts@plt>
    13de:	83 c4 10             	add    esp,0x10
    13e1:	b8 00 00 00 00       	mov    eax,0x0
    13e6:	eb 17                	jmp    13ff <main+0x1ac>
    13e8:	83 ec 0c             	sub    esp,0xc
    13eb:	8d 83 74 e0 ff ff    	lea    eax,[ebx-0x1f8c]
    13f1:	50                   	push   eax
    13f2:	e8 69 fc ff ff       	call   1060 <puts@plt>
    13f7:	83 c4 10             	add    esp,0x10
    13fa:	b8 01 00 00 00       	mov    eax,0x1
    13ff:	8d 65 f0             	lea    esp,[ebp-0x10]
    1402:	59                   	pop    ecx
    1403:	5b                   	pop    ebx
    1404:	5e                   	pop    esi
    1405:	5f                   	pop    edi
    1406:	5d                   	pop    ebp
    1407:	8d 61 fc             	lea    esp,[ecx-0x4]
    140a:	c3                   	ret

0000140b <__x86.get_pc_thunk.ax>:
    140b:	8b 04 24             	mov    eax,DWORD PTR [esp]
    140e:	c3                   	ret

Disassembly of section .fini:

00001410 <_fini>:
    1410:	53                   	push   ebx
    1411:	83 ec 08             	sub    esp,0x8
    1414:	e8 d7 fc ff ff       	call   10f0 <__x86.get_pc_thunk.bx>
    1419:	81 c3 db 2b 00 00    	add    ebx,0x2bdb
    141f:	83 c4 08             	add    esp,0x8
    1422:	5b                   	pop    ebx
    1423:	c3                   	ret
