.class Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;
.super Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type3Message"
.end annotation


# instance fields
.field protected domainBytes:[B

.field protected hostBytes:[B

.field protected lmResp:[B

.field protected ntResp:[B

.field protected sessionKey:[B

.field protected type2Flags:I

.field protected userBytes:[B


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)V
    .locals 11
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "nonce"    # [B
    .param p6, "type2Flags"    # I
    .param p7, "target"    # Ljava/lang/String;
    .param p8, "targetInformation"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 1071
    invoke-direct {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;-><init>()V

    .line 1073
    move/from16 v0, p6

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    .line 1076
    invoke-static {p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1700(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1078
    .local v9, "unqualifiedHost":Ljava/lang/String;
    invoke-static {p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1800(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1081
    .local v2, "unqualifiedDomain":Ljava/lang/String;
    new-instance v1, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    invoke-direct/range {v1 .. v7}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V

    .line 1089
    .local v1, "gen":Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;
    const/high16 v3, 0x800000

    and-int v3, v3, p6

    if-eqz v3, :cond_1

    if-eqz p8, :cond_1

    if-eqz p7, :cond_1

    .line 1091
    :try_start_0
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    .line 1092
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    .line 1093
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_0

    .line 1094
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLanManagerSessionKey()[B
    :try_end_0
    .catch Lcom/ning/http/client/ntlm/NTLMEngineException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 1131
    .local v10, "userSessionKey":[B
    :goto_0
    and-int/lit8 v3, p6, 0x10

    if-eqz v3, :cond_7

    .line 1132
    const/high16 v3, 0x40000000    # 2.0f

    and-int v3, v3, p6

    if-eqz v3, :cond_6

    .line 1133
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getSecondaryKey()[B

    move-result-object v3

    invoke-static {v3, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1900([B[B)[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    .line 1140
    :goto_1
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$2000()Ljava/nio/charset/Charset;

    move-result-object v3

    if-nez v3, :cond_8

    .line 1141
    new-instance v3, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v4, "Unicode not supported"

    invoke-direct {v3, v4}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1096
    .end local v10    # "userSessionKey":[B
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2UserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1100
    .end local v10    # "userSessionKey":[B
    :cond_1
    const/high16 v3, 0x80000

    and-int v3, v3, p6

    if-eqz v3, :cond_3

    .line 1102
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    .line 1103
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    .line 1104
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_2

    .line 1105
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1107
    .end local v10    # "userSessionKey":[B
    :cond_2
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLM2SessionResponseUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1110
    .end local v10    # "userSessionKey":[B
    :cond_3
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    .line 1111
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    .line 1112
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_4

    .line 1113
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1115
    .end local v10    # "userSessionKey":[B
    :cond_4
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMUserSessionKey()[B
    :try_end_1
    .catch Lcom/ning/http/client/ntlm/NTLMEngineException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1119
    .end local v10    # "userSessionKey":[B
    :catch_0
    move-exception v8

    .line 1122
    .local v8, "e":Lcom/ning/http/client/ntlm/NTLMEngineException;
    const/4 v3, 0x0

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    .line 1123
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    .line 1124
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_5

    .line 1125
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1127
    .end local v10    # "userSessionKey":[B
    :cond_5
    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_0

    .line 1135
    .end local v8    # "e":Lcom/ning/http/client/ntlm/NTLMEngineException;
    :cond_6
    iput-object v10, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    goto :goto_1

    .line 1138
    :cond_7
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    goto :goto_1

    .line 1143
    :cond_8
    if-eqz v9, :cond_9

    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$2000()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    :goto_2
    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->hostBytes:[B

    .line 1144
    if-eqz v2, :cond_a

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$2000()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    :goto_3
    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->domainBytes:[B

    .line 1145
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$2000()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->userBytes:[B

    .line 1146
    return-void

    .line 1143
    :cond_9
    const/4 v3, 0x0

    goto :goto_2

    .line 1144
    :cond_a
    const/4 v3, 0x0

    goto :goto_3
.end method


# virtual methods
.method getResponse()Ljava/lang/String;
    .locals 17

    .prologue
    .line 1151
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    array-length v8, v14

    .line 1152
    .local v8, "ntRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    array-length v6, v14

    .line 1154
    .local v6, "lmRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->domainBytes:[B

    if-eqz v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->domainBytes:[B

    array-length v1, v14

    .line 1155
    .local v1, "domainLen":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->hostBytes:[B

    if-eqz v14, :cond_2

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->hostBytes:[B

    array-length v4, v14

    .line 1156
    .local v4, "hostLen":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->userBytes:[B

    array-length v12, v14

    .line 1158
    .local v12, "userLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_3

    .line 1159
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    array-length v10, v14

    .line 1165
    .local v10, "sessionKeyLen":I
    :goto_2
    const/16 v7, 0x48

    .line 1166
    .local v7, "lmRespOffset":I
    add-int/lit8 v9, v6, 0x48

    .line 1167
    .local v9, "ntRespOffset":I
    add-int v2, v9, v8

    .line 1168
    .local v2, "domainOffset":I
    add-int v13, v2, v1

    .line 1169
    .local v13, "userOffset":I
    add-int v5, v13, v12

    .line 1170
    .local v5, "hostOffset":I
    add-int v11, v5, v4

    .line 1171
    .local v11, "sessionKeyOffset":I
    add-int v3, v11, v10

    .line 1174
    .local v3, "finalLength":I
    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->prepareResponse(II)V

    .line 1177
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1178
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1181
    const/16 v14, 0x48

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1184
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1185
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1188
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1191
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1192
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1195
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1198
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1199
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1202
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1205
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1206
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1209
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1212
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1213
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1216
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1219
    move-object/from16 v0, p0

    iget v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit16 v14, v14, 0x80

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit16 v15, v15, 0x200

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const/high16 v16, 0x80000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    const/high16 v15, 0x2000000

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const v16, 0x8000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x20

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x10

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const/high16 v16, 0x20000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const/high16 v16, -0x80000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const/high16 v16, 0x40000000    # 2.0f

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    const/high16 v16, 0x800000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x1

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x4

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1246
    const/16 v14, 0x105

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1248
    const/16 v14, 0xa28

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addULong(I)V

    .line 1250
    const/16 v14, 0xf00

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addUShort(I)V

    .line 1253
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->lmResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1254
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->ntResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1255
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->domainBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1256
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->userBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1257
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->hostBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1258
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_0

    .line 1259
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->sessionKey:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->addBytes([B)V

    .line 1262
    :cond_0
    invoke-super/range {p0 .. p0}, Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;->getResponse()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 1154
    .end local v1    # "domainLen":I
    .end local v2    # "domainOffset":I
    .end local v3    # "finalLength":I
    .end local v4    # "hostLen":I
    .end local v5    # "hostOffset":I
    .end local v7    # "lmRespOffset":I
    .end local v9    # "ntRespOffset":I
    .end local v10    # "sessionKeyLen":I
    .end local v11    # "sessionKeyOffset":I
    .end local v12    # "userLen":I
    .end local v13    # "userOffset":I
    :cond_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 1155
    .restart local v1    # "domainLen":I
    :cond_2
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 1161
    .restart local v4    # "hostLen":I
    .restart local v12    # "userLen":I
    :cond_3
    const/4 v10, 0x0

    .restart local v10    # "sessionKeyLen":I
    goto/16 :goto_2
.end method
