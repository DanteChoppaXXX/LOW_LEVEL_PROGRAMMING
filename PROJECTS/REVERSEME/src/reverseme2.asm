
reverseme2:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:	53                   	push   ebx
    1001:	83 ec 08             	sub    esp,0x8
    1004:	e8 d7 00 00 00       	call   10e0 <__x86.get_pc_thunk.bx>
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

00001090 <__isoc99_scanf@plt>:
    1090:	ff a3 24 00 00 00    	jmp    DWORD PTR [ebx+0x24]
    1096:	68 30 00 00 00       	push   0x30
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

000010a0 <__cxa_finalize@plt>:
    10a0:	ff a3 f0 ff ff ff    	jmp    DWORD PTR [ebx-0x10]
    10a6:	66 90                	xchg   ax,ax

Disassembly of section .text:

000010b0 <_start>:
    10b0:	31 ed                	xor    ebp,ebp
    10b2:	5e                   	pop    esi
    10b3:	89 e1                	mov    ecx,esp
    10b5:	83 e4 f0             	and    esp,0xfffffff0
    10b8:	50                   	push   eax
    10b9:	54                   	push   esp
    10ba:	52                   	push   edx
    10bb:	e8 18 00 00 00       	call   10d8 <_start+0x28>
    10c0:	81 c3 34 2f 00 00    	add    ebx,0x2f34
    10c6:	6a 00                	push   0x0
    10c8:	6a 00                	push   0x0
    10ca:	51                   	push   ecx
    10cb:	56                   	push   esi
    10cc:	ff b3 f8 ff ff ff    	push   DWORD PTR [ebx-0x8]
    10d2:	e8 59 ff ff ff       	call   1030 <__libc_start_main@plt>
    10d7:	f4                   	hlt
    10d8:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10db:	c3                   	ret
    10dc:	66 90                	xchg   ax,ax
    10de:	66 90                	xchg   ax,ax

000010e0 <__x86.get_pc_thunk.bx>:
    10e0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10e3:	c3                   	ret
    10e4:	66 90                	xchg   ax,ax
    10e6:	66 90                	xchg   ax,ax
    10e8:	66 90                	xchg   ax,ax
    10ea:	66 90                	xchg   ax,ax
    10ec:	66 90                	xchg   ax,ax
    10ee:	66 90                	xchg   ax,ax

000010f0 <deregister_tm_clones>:
    10f0:	e8 e4 00 00 00       	call   11d9 <__x86.get_pc_thunk.dx>
    10f5:	81 c2 ff 2e 00 00    	add    edx,0x2eff
    10fb:	8d 8a 30 00 00 00    	lea    ecx,[edx+0x30]
    1101:	8d 82 30 00 00 00    	lea    eax,[edx+0x30]
    1107:	39 c8                	cmp    eax,ecx
    1109:	74 1d                	je     1128 <deregister_tm_clones+0x38>
    110b:	8b 82 ec ff ff ff    	mov    eax,DWORD PTR [edx-0x14]
    1111:	85 c0                	test   eax,eax
    1113:	74 13                	je     1128 <deregister_tm_clones+0x38>
    1115:	55                   	push   ebp
    1116:	89 e5                	mov    ebp,esp
    1118:	83 ec 14             	sub    esp,0x14
    111b:	51                   	push   ecx
    111c:	ff d0                	call   eax
    111e:	83 c4 10             	add    esp,0x10
    1121:	c9                   	leave
    1122:	c3                   	ret
    1123:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]
    1128:	c3                   	ret
    1129:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00001130 <register_tm_clones>:
    1130:	e8 a4 00 00 00       	call   11d9 <__x86.get_pc_thunk.dx>
    1135:	81 c2 bf 2e 00 00    	add    edx,0x2ebf
    113b:	55                   	push   ebp
    113c:	89 e5                	mov    ebp,esp
    113e:	53                   	push   ebx
    113f:	8d 8a 30 00 00 00    	lea    ecx,[edx+0x30]
    1145:	8d 82 30 00 00 00    	lea    eax,[edx+0x30]
    114b:	83 ec 04             	sub    esp,0x4
    114e:	29 c8                	sub    eax,ecx
    1150:	89 c3                	mov    ebx,eax
    1152:	c1 e8 1f             	shr    eax,0x1f
    1155:	c1 fb 02             	sar    ebx,0x2
    1158:	01 d8                	add    eax,ebx
    115a:	d1 f8                	sar    eax,1
    115c:	74 14                	je     1172 <register_tm_clones+0x42>
    115e:	8b 92 fc ff ff ff    	mov    edx,DWORD PTR [edx-0x4]
    1164:	85 d2                	test   edx,edx
    1166:	74 0a                	je     1172 <register_tm_clones+0x42>
    1168:	83 ec 08             	sub    esp,0x8
    116b:	50                   	push   eax
    116c:	51                   	push   ecx
    116d:	ff d2                	call   edx
    116f:	83 c4 10             	add    esp,0x10
    1172:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1175:	c9                   	leave
    1176:	c3                   	ret
    1177:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
    117e:	00 
    117f:	90                   	nop

00001180 <__do_global_dtors_aux>:
    1180:	f3 0f 1e fb          	endbr32
    1184:	55                   	push   ebp
    1185:	89 e5                	mov    ebp,esp
    1187:	53                   	push   ebx
    1188:	e8 53 ff ff ff       	call   10e0 <__x86.get_pc_thunk.bx>
    118d:	81 c3 67 2e 00 00    	add    ebx,0x2e67
    1193:	83 ec 04             	sub    esp,0x4
    1196:	80 bb 30 00 00 00 00 	cmp    BYTE PTR [ebx+0x30],0x0
    119d:	75 27                	jne    11c6 <__do_global_dtors_aux+0x46>
    119f:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
    11a5:	85 c0                	test   eax,eax
    11a7:	74 11                	je     11ba <__do_global_dtors_aux+0x3a>
    11a9:	83 ec 0c             	sub    esp,0xc
    11ac:	ff b3 2c 00 00 00    	push   DWORD PTR [ebx+0x2c]
    11b2:	e8 e9 fe ff ff       	call   10a0 <__cxa_finalize@plt>
    11b7:	83 c4 10             	add    esp,0x10
    11ba:	e8 31 ff ff ff       	call   10f0 <deregister_tm_clones>
    11bf:	c6 83 30 00 00 00 01 	mov    BYTE PTR [ebx+0x30],0x1
    11c6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    11c9:	c9                   	leave
    11ca:	c3                   	ret
    11cb:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]

000011d0 <frame_dummy>:
    11d0:	f3 0f 1e fb          	endbr32
    11d4:	e9 57 ff ff ff       	jmp    1130 <register_tm_clones>

000011d9 <__x86.get_pc_thunk.dx>:
    11d9:	8b 14 24             	mov    edx,DWORD PTR [esp]
    11dc:	c3                   	ret

000011dd <main>:
    11dd:	8d 4c 24 04          	lea    ecx,[esp+0x4]
    11e1:	83 e4 f0             	and    esp,0xfffffff0
    11e4:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
    11e7:	55                   	push   ebp
    11e8:	89 e5                	mov    ebp,esp
    11ea:	57                   	push   edi
    11eb:	56                   	push   esi
    11ec:	53                   	push   ebx
    11ed:	51                   	push   ecx
    11ee:	81 ec b8 00 00 00    	sub    esp,0xb8
    11f4:	e8 e7 fe ff ff       	call   10e0 <__x86.get_pc_thunk.bx>
    11f9:	81 c3 fb 2d 00 00    	add    ebx,0x2dfb
    11ff:	8d 8d 4a ff ff ff    	lea    ecx,[ebp-0xb6]
    1205:	8d 83 78 e0 ff ff    	lea    eax,[ebx-0x1f88]
    120b:	ba 8e 00 00 00       	mov    edx,0x8e
    1210:	8b 30                	mov    esi,DWORD PTR [eax]
    1212:	89 31                	mov    DWORD PTR [ecx],esi
    1214:	8b 74 10 fc          	mov    esi,DWORD PTR [eax+edx*1-0x4]
    1218:	89 74 11 fc          	mov    DWORD PTR [ecx+edx*1-0x4],esi
    121c:	8d 79 04             	lea    edi,[ecx+0x4]
    121f:	83 e7 fc             	and    edi,0xfffffffc
    1222:	29 f9                	sub    ecx,edi
    1224:	29 c8                	sub    eax,ecx
    1226:	01 ca                	add    edx,ecx
    1228:	83 e2 fc             	and    edx,0xfffffffc
    122b:	c1 ea 02             	shr    edx,0x2
    122e:	89 c6                	mov    esi,eax
    1230:	89 d1                	mov    ecx,edx
    1232:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
    1234:	c7 45 dc 00 01 00 00 	mov    DWORD PTR [ebp-0x24],0x100
    123b:	83 ec 08             	sub    esp,0x8
    123e:	6a 00                	push   0x0
    1240:	6a ff                	push   0xffffffff
    1242:	6a 22                	push   0x22
    1244:	6a 07                	push   0x7
    1246:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
    1249:	6a 00                	push   0x0
    124b:	e8 30 fe ff ff       	call   1080 <mmap@plt>
    1250:	83 c4 20             	add    esp,0x20
    1253:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
    1256:	83 7d e4 ff          	cmp    DWORD PTR [ebp-0x1c],0xffffffff
    125a:	75 1c                	jne    1278 <main+0x9b>
    125c:	83 ec 0c             	sub    esp,0xc
    125f:	8d 83 14 e0 ff ff    	lea    eax,[ebx-0x1fec]
    1265:	50                   	push   eax
    1266:	e8 e5 fd ff ff       	call   1050 <perror@plt>
    126b:	83 c4 10             	add    esp,0x10
    126e:	83 ec 0c             	sub    esp,0xc
    1271:	6a 01                	push   0x1
    1273:	e8 f8 fd ff ff       	call   1070 <exit@plt>
    1278:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
    127f:	eb 1f                	jmp    12a0 <main+0xc3>
    1281:	8d 95 4a ff ff ff    	lea    edx,[ebp-0xb6]
    1287:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    128a:	01 d0                	add    eax,edx
    128c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    128f:	83 f0 a3             	xor    eax,0xffffffa3
    1292:	0f b6 c0             	movzx  eax,al
    1295:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
    1298:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    129c:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    12a0:	81 7d e0 8d 00 00 00 	cmp    DWORD PTR [ebp-0x20],0x8d
    12a7:	76 d8                	jbe    1281 <main+0xa4>
    12a9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    12ac:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
    12af:	83 ec 0c             	sub    esp,0xc
    12b2:	8d 83 19 e0 ff ff    	lea    eax,[ebx-0x1fe7]
    12b8:	50                   	push   eax
    12b9:	e8 82 fd ff ff       	call   1040 <printf@plt>
    12be:	83 c4 10             	add    esp,0x10
    12c1:	83 ec 08             	sub    esp,0x8
    12c4:	8d 85 40 ff ff ff    	lea    eax,[ebp-0xc0]
    12ca:	50                   	push   eax
    12cb:	8d 83 2e e0 ff ff    	lea    eax,[ebx-0x1fd2]
    12d1:	50                   	push   eax
    12d2:	e8 b9 fd ff ff       	call   1090 <__isoc99_scanf@plt>
    12d7:	83 c4 10             	add    esp,0x10
    12da:	83 ec 0c             	sub    esp,0xc
    12dd:	8d 85 40 ff ff ff    	lea    eax,[ebp-0xc0]
    12e3:	50                   	push   eax
    12e4:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
    12e7:	ff d0                	call   eax
    12e9:	83 c4 10             	add    esp,0x10
    12ec:	85 c0                	test   eax,eax
    12ee:	74 2b                	je     131b <main+0x13e>
    12f0:	83 ec 0c             	sub    esp,0xc
    12f3:	8d 85 40 ff ff ff    	lea    eax,[ebp-0xc0]
    12f9:	50                   	push   eax
    12fa:	e8 61 fd ff ff       	call   1060 <puts@plt>
    12ff:	83 c4 10             	add    esp,0x10
    1302:	83 ec 0c             	sub    esp,0xc
    1305:	8d 83 34 e0 ff ff    	lea    eax,[ebx-0x1fcc]
    130b:	50                   	push   eax
    130c:	e8 4f fd ff ff       	call   1060 <puts@plt>
    1311:	83 c4 10             	add    esp,0x10
    1314:	b8 00 00 00 00       	mov    eax,0x0
    1319:	eb 17                	jmp    1332 <main+0x155>
    131b:	83 ec 0c             	sub    esp,0xc
    131e:	8d 83 58 e0 ff ff    	lea    eax,[ebx-0x1fa8]
    1324:	50                   	push   eax
    1325:	e8 36 fd ff ff       	call   1060 <puts@plt>
    132a:	83 c4 10             	add    esp,0x10
    132d:	b8 01 00 00 00       	mov    eax,0x1
    1332:	8d 65 f0             	lea    esp,[ebp-0x10]
    1335:	59                   	pop    ecx
    1336:	5b                   	pop    ebx
    1337:	5e                   	pop    esi
    1338:	5f                   	pop    edi
    1339:	5d                   	pop    ebp
    133a:	8d 61 fc             	lea    esp,[ecx-0x4]
    133d:	c3                   	ret

Disassembly of section .fini:

00001340 <_fini>:
    1340:	53                   	push   ebx
    1341:	83 ec 08             	sub    esp,0x8
    1344:	e8 97 fd ff ff       	call   10e0 <__x86.get_pc_thunk.bx>
    1349:	81 c3 ab 2c 00 00    	add    ebx,0x2cab
    134f:	83 c4 08             	add    esp,0x8
    1352:	5b                   	pop    ebx
    1353:	c3                   	ret
