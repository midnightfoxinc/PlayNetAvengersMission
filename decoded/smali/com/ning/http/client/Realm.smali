.class public Lcom/ning/http/client/Realm;
.super Ljava/lang/Object;
.source "Realm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/Realm$1;,
        Lcom/ning/http/client/Realm$RealmBuilder;,
        Lcom/ning/http/client/Realm$AuthScheme;
    }
.end annotation


# static fields
.field private static final DEFAULT_NC:Ljava/lang/String; = "00000001"


# instance fields
.field private final algorithm:Ljava/lang/String;

.field private final charset:Ljava/nio/charset/Charset;

.field private final cnonce:Ljava/lang/String;

.field private final methodName:Ljava/lang/String;

.field private final nc:Ljava/lang/String;

.field private final nonce:Ljava/lang/String;

.field private final ntlmDomain:Ljava/lang/String;

.field private final ntlmHost:Ljava/lang/String;

.field private final omitQuery:Z

.field private final opaque:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final principal:Ljava/lang/String;

.field private final qop:Ljava/lang/String;

.field private final realmName:Ljava/lang/String;

.field private final response:Ljava/lang/String;

.field private final scheme:Lcom/ning/http/client/Realm$AuthScheme;

.field private final targetProxy:Z

.field private final uri:Lcom/ning/http/client/uri/Uri;

.field private final useAbsoluteURI:Z

.field private final usePreemptiveAuth:Z


# direct methods
.method private constructor <init>(Lcom/ning/http/client/Realm$AuthScheme;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ning/http/client/uri/Uri;Ljava/lang/String;ZLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 1
    .param p1, "scheme"    # Lcom/ning/http/client/Realm$AuthScheme;
    .param p2, "principal"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "realmName"    # Ljava/lang/String;
    .param p5, "nonce"    # Ljava/lang/String;
    .param p6, "algorithm"    # Ljava/lang/String;
    .param p7, "response"    # Ljava/lang/String;
    .param p8, "qop"    # Ljava/lang/String;
    .param p9, "nc"    # Ljava/lang/String;
    .param p10, "cnonce"    # Ljava/lang/String;
    .param p11, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p12, "method"    # Ljava/lang/String;
    .param p13, "usePreemptiveAuth"    # Z
    .param p14, "ntlmDomain"    # Ljava/lang/String;
    .param p15, "charset"    # Ljava/nio/charset/Charset;
    .param p16, "ntlmHost"    # Ljava/lang/String;
    .param p17, "opaque"    # Ljava/lang/String;
    .param p18, "useAbsoluteURI"    # Z
    .param p19, "omitQuery"    # Z
    .param p20, "targetProxy"    # Z

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p2, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    .line 91
    iput-object p3, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    .line 92
    iput-object p1, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    .line 93
    iput-object p4, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    .line 94
    iput-object p5, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    .line 95
    iput-object p6, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    .line 96
    iput-object p7, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    .line 97
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/ning/http/client/Realm;->opaque:Ljava/lang/String;

    .line 98
    iput-object p8, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    .line 99
    iput-object p9, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    .line 100
    iput-object p10, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    .line 101
    iput-object p11, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    .line 102
    iput-object p12, p0, Lcom/ning/http/client/Realm;->methodName:Ljava/lang/String;

    .line 103
    iput-boolean p13, p0, Lcom/ning/http/client/Realm;->usePreemptiveAuth:Z

    .line 104
    iput-object p14, p0, Lcom/ning/http/client/Realm;->ntlmDomain:Ljava/lang/String;

    .line 105
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/ning/http/client/Realm;->charset:Ljava/nio/charset/Charset;

    .line 106
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/ning/http/client/Realm;->ntlmHost:Ljava/lang/String;

    .line 107
    move/from16 v0, p18

    iput-boolean v0, p0, Lcom/ning/http/client/Realm;->useAbsoluteURI:Z

    .line 108
    move/from16 v0, p19

    iput-boolean v0, p0, Lcom/ning/http/client/Realm;->omitQuery:Z

    .line 109
    move/from16 v0, p20

    iput-boolean v0, p0, Lcom/ning/http/client/Realm;->targetProxy:Z

    .line 110
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/Realm$AuthScheme;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ning/http/client/uri/Uri;Ljava/lang/String;ZLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;ZZZLcom/ning/http/client/Realm$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/Realm$AuthScheme;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Ljava/lang/String;
    .param p6, "x5"    # Ljava/lang/String;
    .param p7, "x6"    # Ljava/lang/String;
    .param p8, "x7"    # Ljava/lang/String;
    .param p9, "x8"    # Ljava/lang/String;
    .param p10, "x9"    # Ljava/lang/String;
    .param p11, "x10"    # Lcom/ning/http/client/uri/Uri;
    .param p12, "x11"    # Ljava/lang/String;
    .param p13, "x12"    # Z
    .param p14, "x13"    # Ljava/lang/String;
    .param p15, "x14"    # Ljava/nio/charset/Charset;
    .param p16, "x15"    # Ljava/lang/String;
    .param p17, "x16"    # Ljava/lang/String;
    .param p18, "x17"    # Z
    .param p19, "x18"    # Z
    .param p20, "x19"    # Z
    .param p21, "x20"    # Lcom/ning/http/client/Realm$1;

    .prologue
    .line 34
    invoke-direct/range {p0 .. p20}, Lcom/ning/http/client/Realm;-><init>(Lcom/ning/http/client/Realm$AuthScheme;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ning/http/client/uri/Uri;Ljava/lang/String;ZLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 209
    if-ne p0, p1, :cond_1

    .line 228
    :cond_0
    :goto_0
    return v1

    .line 210
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 212
    check-cast v0, Lcom/ning/http/client/Realm;

    .line 214
    .local v0, "realm":Lcom/ning/http/client/Realm;
    iget-object v3, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, v0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 215
    :cond_6
    iget-object v3, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    :cond_7
    move v1, v2

    goto :goto_0

    :cond_8
    iget-object v3, v0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 216
    :cond_9
    iget-object v3, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    :cond_a
    move v1, v2

    goto :goto_0

    :cond_b
    iget-object v3, v0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 217
    :cond_c
    iget-object v3, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    :cond_d
    move v1, v2

    goto :goto_0

    :cond_e
    iget-object v3, v0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 218
    :cond_f
    iget-object v3, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move v1, v2

    goto :goto_0

    :cond_11
    iget-object v3, v0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    if-nez v3, :cond_10

    .line 219
    :cond_12
    iget-object v3, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    :cond_13
    move v1, v2

    goto/16 :goto_0

    :cond_14
    iget-object v3, v0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    if-nez v3, :cond_13

    .line 220
    :cond_15
    iget-object v3, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    if-eqz v3, :cond_17

    iget-object v3, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    :cond_16
    move v1, v2

    goto/16 :goto_0

    :cond_17
    iget-object v3, v0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    if-nez v3, :cond_16

    .line 221
    :cond_18
    iget-object v3, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    :cond_19
    move v1, v2

    goto/16 :goto_0

    :cond_1a
    iget-object v3, v0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    if-nez v3, :cond_19

    .line 222
    :cond_1b
    iget-object v3, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    if-eqz v3, :cond_1d

    iget-object v3, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    :cond_1c
    move v1, v2

    goto/16 :goto_0

    :cond_1d
    iget-object v3, v0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    if-nez v3, :cond_1c

    .line 223
    :cond_1e
    iget-object v3, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    if-eq v3, v4, :cond_1f

    move v1, v2

    goto/16 :goto_0

    .line 224
    :cond_1f
    iget-object v3, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    if-eqz v3, :cond_21

    iget-object v3, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    iget-object v4, v0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v3, v4}, Lcom/ning/http/client/uri/Uri;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    :cond_20
    move v1, v2

    goto/16 :goto_0

    :cond_21
    iget-object v3, v0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    if-nez v3, :cond_20

    .line 225
    :cond_22
    iget-boolean v4, p0, Lcom/ning/http/client/Realm;->useAbsoluteURI:Z

    iget-boolean v3, v0, Lcom/ning/http/client/Realm;->useAbsoluteURI:Z

    if-nez v3, :cond_23

    move v3, v1

    :goto_1
    if-eq v4, v3, :cond_24

    move v1, v2

    goto/16 :goto_0

    :cond_23
    move v3, v2

    goto :goto_1

    .line 226
    :cond_24
    iget-boolean v4, p0, Lcom/ning/http/client/Realm;->omitQuery:Z

    iget-boolean v3, v0, Lcom/ning/http/client/Realm;->omitQuery:Z

    if-nez v3, :cond_25

    move v3, v1

    :goto_2
    if-eq v4, v3, :cond_0

    move v1, v2

    goto/16 :goto_0

    :cond_25
    move v3, v2

    goto :goto_2
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    return-object v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/ning/http/client/Realm;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getCnonce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/ning/http/client/Realm;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getNc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    return-object v0
.end method

.method public getNonce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    return-object v0
.end method

.method public getNtlmDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/ning/http/client/Realm;->ntlmDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getNtlmHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lcom/ning/http/client/Realm;->ntlmHost:Ljava/lang/String;

    return-object v0
.end method

.method public getOpaque()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/ning/http/client/Realm;->opaque:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPrincipal()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    return-object v0
.end method

.method public getQop()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    return-object v0
.end method

.method public getRealmName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Lcom/ning/http/client/Realm$AuthScheme;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method public getUsePreemptiveAuth()Z
    .locals 1

    .prologue
    .line 174
    iget-boolean v0, p0, Lcom/ning/http/client/Realm;->usePreemptiveAuth:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 253
    iget-object v2, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 254
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 255
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$AuthScheme;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 256
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int v0, v3, v2

    .line 257
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int v0, v3, v2

    .line 258
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_5
    add-int v0, v3, v2

    .line 259
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_6
    add-int v0, v3, v2

    .line 260
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_7
    add-int v0, v3, v2

    .line 261
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_8
    add-int v0, v3, v2

    .line 262
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_9
    add-int v0, v3, v2

    .line 263
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v1}, Lcom/ning/http/client/uri/Uri;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 264
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 253
    goto/16 :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 254
    goto/16 :goto_1

    :cond_3
    move v2, v1

    .line 255
    goto :goto_2

    :cond_4
    move v2, v1

    .line 256
    goto :goto_3

    :cond_5
    move v2, v1

    .line 257
    goto :goto_4

    :cond_6
    move v2, v1

    .line 258
    goto :goto_5

    :cond_7
    move v2, v1

    .line 259
    goto :goto_6

    :cond_8
    move v2, v1

    .line 260
    goto :goto_7

    :cond_9
    move v2, v1

    .line 261
    goto :goto_8

    :cond_a
    move v2, v1

    .line 262
    goto :goto_9
.end method

.method public isOmitQuery()Z
    .locals 1

    .prologue
    .line 200
    iget-boolean v0, p0, Lcom/ning/http/client/Realm;->omitQuery:Z

    return v0
.end method

.method public isTargetProxy()Z
    .locals 1

    .prologue
    .line 204
    iget-boolean v0, p0, Lcom/ning/http/client/Realm;->targetProxy:Z

    return v0
.end method

.method public isUseAbsoluteURI()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/ning/http/client/Realm;->useAbsoluteURI:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 233
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Realm{principal=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->principal:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", password=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", scheme="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", realmName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->realmName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", nonce=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->nonce:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", algorithm=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", response=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->response:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", qop=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->qop:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", nc=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->nc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cnonce=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->cnonce:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uri=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", methodName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/Realm;->methodName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useAbsoluteURI=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/ning/http/client/Realm;->useAbsoluteURI:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", omitQuery=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/ning/http/client/Realm;->omitQuery:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
