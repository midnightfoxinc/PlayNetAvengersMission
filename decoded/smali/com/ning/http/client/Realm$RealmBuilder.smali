.class public Lcom/ning/http/client/Realm$RealmBuilder;
.super Ljava/lang/Object;
.source "Realm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/Realm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RealmBuilder"
.end annotation


# static fields
.field private static final HEXADECIMAL:[C

.field private static final digestThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/security/MessageDigest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private algorithm:Ljava/lang/String;

.field private charset:Ljava/nio/charset/Charset;

.field private cnonce:Ljava/lang/String;

.field private methodName:Ljava/lang/String;

.field private nc:Ljava/lang/String;

.field private nonce:Ljava/lang/String;

.field private ntlmDomain:Ljava/lang/String;

.field private ntlmHost:Ljava/lang/String;

.field private omitQuery:Z

.field private opaque:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private principal:Ljava/lang/String;

.field private qop:Ljava/lang/String;

.field private realmName:Ljava/lang/String;

.field private response:Ljava/lang/String;

.field private scheme:Lcom/ning/http/client/Realm$AuthScheme;

.field private targetProxy:Z

.field private uri:Lcom/ning/http/client/uri/Uri;

.field private useAbsoluteURI:Z

.field private usePreemptive:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 298
    new-instance v0, Lcom/ning/http/client/Realm$RealmBuilder$1;

    invoke-direct {v0}, Lcom/ning/http/client/Realm$RealmBuilder$1;-><init>()V

    sput-object v0, Lcom/ning/http/client/Realm$RealmBuilder;->digestThreadLocal:Ljava/lang/ThreadLocal;

    .line 611
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ning/http/client/Realm$RealmBuilder;->HEXADECIMAL:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 270
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 277
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->principal:Ljava/lang/String;

    .line 278
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->password:Ljava/lang/String;

    .line 279
    sget-object v0, Lcom/ning/http/client/Realm$AuthScheme;->NONE:Lcom/ning/http/client/Realm$AuthScheme;

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    .line 280
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->realmName:Ljava/lang/String;

    .line 281
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    .line 282
    const-string v0, "MD5"

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->algorithm:Ljava/lang/String;

    .line 283
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->response:Ljava/lang/String;

    .line 284
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->opaque:Ljava/lang/String;

    .line 285
    const-string v0, "auth"

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    .line 286
    const-string v0, "00000001"

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nc:Ljava/lang/String;

    .line 287
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->cnonce:Ljava/lang/String;

    .line 289
    const-string v0, "GET"

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->methodName:Ljava/lang/String;

    .line 290
    iput-boolean v2, p0, Lcom/ning/http/client/Realm$RealmBuilder;->usePreemptive:Z

    .line 291
    const-string v0, "http.auth.ntlm.domain"

    const-string v1, ""

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmDomain:Ljava/lang/String;

    .line 292
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->charset:Ljava/nio/charset/Charset;

    .line 293
    const-string v0, "localhost"

    iput-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmHost:Ljava/lang/String;

    .line 294
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->useAbsoluteURI:Z

    .line 295
    iput-boolean v2, p0, Lcom/ning/http/client/Realm$RealmBuilder;->omitQuery:Z

    .line 296
    iput-boolean v2, p0, Lcom/ning/http/client/Realm$RealmBuilder;->targetProxy:Z

    return-void
.end method

.method private static appendBase16(Ljava/lang/StringBuilder;[B)V
    .locals 4
    .param p0, "buf"    # Ljava/lang/StringBuilder;
    .param p1, "bytes"    # [B

    .prologue
    .line 617
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_0

    .line 618
    aget-byte v3, p1, v1

    and-int/lit8 v2, v3, 0xf

    .line 619
    .local v2, "low":I
    aget-byte v3, p1, v1

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v0, v3, 0x4

    .line 620
    .local v0, "high":I
    sget-object v3, Lcom/ning/http/client/Realm$RealmBuilder;->HEXADECIMAL:[C

    aget-char v3, v3, v0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 621
    sget-object v3, Lcom/ning/http/client/Realm$RealmBuilder;->HEXADECIMAL:[C

    aget-char v3, v3, v2

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 617
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 623
    .end local v0    # "high":I
    .end local v2    # "low":I
    :cond_0
    return-void
.end method

.method private match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "headerLine"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 536
    if-nez p1, :cond_1

    .line 537
    const-string v2, ""

    .line 548
    :cond_0
    :goto_0
    return-object v2

    .line 540
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 541
    .local v0, "match":I
    if-gtz v0, :cond_2

    const-string v2, ""

    goto :goto_0

    .line 544
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    add-int/2addr v0, v3

    .line 545
    const-string v3, ","

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 546
    .local v1, "traillingComa":I
    if-lez v1, :cond_4

    .end local v1    # "traillingComa":I
    :goto_1
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 547
    .local v2, "value":Ljava/lang/String;
    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 548
    :cond_3
    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 546
    .end local v2    # "value":Ljava/lang/String;
    .restart local v1    # "traillingComa":I
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_1
.end method

.method private newCnonce(Ljava/security/MessageDigest;)V
    .locals 2
    .param p1, "md"    # Ljava/security/MessageDigest;

    .prologue
    .line 526
    const/16 v1, 0x8

    new-array v0, v1, [B

    .line 527
    .local v0, "b":[B
    invoke-static {}, Ljava/util/concurrent/ThreadLocalRandom;->current()Ljava/util/concurrent/ThreadLocalRandom;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadLocalRandom;->nextBytes([B)V

    .line 528
    invoke-virtual {p1, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 529
    invoke-static {v0}, Lcom/ning/http/client/Realm$RealmBuilder;->toHexString([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->cnonce:Ljava/lang/String;

    .line 530
    return-void
.end method

.method private newResponse(Ljava/security/MessageDigest;)V
    .locals 9
    .param p1, "md"    # Ljava/security/MessageDigest;

    .prologue
    const/4 v8, 0x0

    const/16 v7, 0x3a

    .line 562
    iget-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v5}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v4

    .line 564
    .local v4, "url":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v3

    .line 565
    .local v3, "sb":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->principal:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/ning/http/client/Realm$RealmBuilder;->realmName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/ning/http/client/Realm$RealmBuilder;->password:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    sget-object v5, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v3, v5}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    .line 571
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 572
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 574
    .local v1, "ha1":[B
    iget-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->methodName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    sget-object v5, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v3, v5}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    .line 579
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 580
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 582
    .local v2, "ha2":[B
    invoke-static {v3, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->appendBase16(Ljava/lang/StringBuilder;[B)V

    .line 583
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 585
    iget-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    invoke-static {v5}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 587
    iget-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nc:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/ning/http/client/Realm$RealmBuilder;->cnonce:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 595
    :cond_0
    invoke-static {v3, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->appendBase16(Ljava/lang/StringBuilder;[B)V

    .line 596
    sget-object v5, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v3, v5}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    .line 597
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 598
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 599
    .local v0, "digest":[B
    invoke-static {v0}, Lcom/ning/http/client/Realm$RealmBuilder;->toHexString([B)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/ning/http/client/Realm$RealmBuilder;->response:Ljava/lang/String;

    .line 600
    return-void
.end method

.method private static toHexString([B)Ljava/lang/String;
    .locals 3
    .param p0, "data"    # [B

    .prologue
    .line 603
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 604
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-static {v1, p0}, Lcom/ning/http/client/Realm$RealmBuilder;->appendBase16(Ljava/lang/StringBuilder;[B)V

    .line 605
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 606
    .local v0, "hex":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 607
    return-object v0
.end method


# virtual methods
.method public build()Lcom/ning/http/client/Realm;
    .locals 25

    .prologue
    .line 633
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    invoke-static {v2}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 634
    sget-object v2, Lcom/ning/http/client/Realm$RealmBuilder;->digestThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/security/MessageDigest;

    .line 635
    .local v24, "md":Ljava/security/MessageDigest;
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->newCnonce(Ljava/security/MessageDigest;)V

    .line 636
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->newResponse(Ljava/security/MessageDigest;)V

    .line 639
    .end local v24    # "md":Ljava/security/MessageDigest;
    :cond_0
    new-instance v2, Lcom/ning/http/client/Realm;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/Realm$RealmBuilder;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/Realm$RealmBuilder;->principal:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/Realm$RealmBuilder;->password:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/ning/http/client/Realm$RealmBuilder;->realmName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/ning/http/client/Realm$RealmBuilder;->algorithm:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/ning/http/client/Realm$RealmBuilder;->response:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/ning/http/client/Realm$RealmBuilder;->nc:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/ning/http/client/Realm$RealmBuilder;->cnonce:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/ning/http/client/Realm$RealmBuilder;->uri:Lcom/ning/http/client/uri/Uri;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/ning/http/client/Realm$RealmBuilder;->methodName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/ning/http/client/Realm$RealmBuilder;->usePreemptive:Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmDomain:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->charset:Ljava/nio/charset/Charset;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmHost:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->opaque:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->useAbsoluteURI:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->omitQuery:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/Realm$RealmBuilder;->targetProxy:Z

    move/from16 v22, v0

    const/16 v23, 0x0

    invoke-direct/range {v2 .. v23}, Lcom/ning/http/client/Realm;-><init>(Lcom/ning/http/client/Realm$AuthScheme;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ning/http/client/uri/Uri;Ljava/lang/String;ZLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;ZZZLcom/ning/http/client/Realm$1;)V

    return-object v2
.end method

.method public clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 1
    .param p1, "clone"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 504
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getRealmName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setRealmName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 505
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setAlgorithm(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 506
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getMethodName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 507
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getNc()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setNc(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 508
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getNonce()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setNonce(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 509
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getPassword()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setPassword(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 510
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setPrincipal(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 511
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setCharset(Ljava/nio/charset/Charset;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 512
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getOpaque()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setOpaque(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 513
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getQop()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setQop(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 514
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 515
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 516
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 517
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getNtlmDomain()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 518
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getNtlmHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setNtlmHost(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 519
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->isUseAbsoluteURI()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setUseAbsoluteURI(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 520
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->isOmitQuery()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setOmitQuery(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 521
    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->isTargetProxy()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setTargetProxy(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 522
    return-object p0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->algorithm:Ljava/lang/String;

    return-object v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 552
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getNc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nc:Ljava/lang/String;

    return-object v0
.end method

.method public getNonce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    return-object v0
.end method

.method public getNtlmDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getNtlmHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 319
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmHost:Ljava/lang/String;

    return-object v0
.end method

.method public getOpaque()Ljava/lang/String;
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->opaque:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPrincipal()Ljava/lang/String;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->principal:Ljava/lang/String;

    return-object v0
.end method

.method public getQop()Ljava/lang/String;
    .locals 1

    .prologue
    .line 401
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    return-object v0
.end method

.method public getRealmName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->realmName:Ljava/lang/String;

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Lcom/ning/http/client/Realm$AuthScheme;
    .locals 1

    .prologue
    .line 347
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 419
    iget-object v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method public getUsePreemptiveAuth()Z
    .locals 1

    .prologue
    .line 437
    iget-boolean v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->usePreemptive:Z

    return v0
.end method

.method public isOmitQuery()Z
    .locals 1

    .prologue
    .line 455
    iget-boolean v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->omitQuery:Z

    return v0
.end method

.method public isTargetProxy()Z
    .locals 1

    .prologue
    .line 464
    iget-boolean v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->targetProxy:Z

    return v0
.end method

.method public isUseAbsoluteURI()Z
    .locals 1

    .prologue
    .line 446
    iget-boolean v0, p0, Lcom/ning/http/client/Realm$RealmBuilder;->useAbsoluteURI:Z

    return v0
.end method

.method public parseProxyAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 1
    .param p1, "headerLine"    # Ljava/lang/String;

    .prologue
    .line 490
    const-string v0, "realm"

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setRealmName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 491
    const-string v0, "nonce"

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setNonce(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 492
    const-string v0, "opaque"

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setOpaque(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 493
    const-string v0, "qop"

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setQop(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 494
    invoke-virtual {p0}, Lcom/ning/http/client/Realm$RealmBuilder;->getNonce()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 495
    sget-object v0, Lcom/ning/http/client/Realm$AuthScheme;->DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 499
    :goto_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setTargetProxy(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 500
    return-object p0

    .line 497
    :cond_0
    sget-object v0, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    goto :goto_0
.end method

.method public parseWWWAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 2
    .param p1, "headerLine"    # Ljava/lang/String;

    .prologue
    .line 473
    const-string v1, "realm"

    invoke-direct {p0, p1, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setRealmName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 474
    const-string v1, "nonce"

    invoke-direct {p0, p1, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setNonce(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 475
    const-string v1, "algorithm"

    invoke-direct {p0, p1, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 476
    .local v0, "algorithm":Ljava/lang/String;
    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 477
    invoke-virtual {p0, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->setAlgorithm(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 479
    :cond_0
    const-string v1, "opaque"

    invoke-direct {p0, p1, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setOpaque(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 480
    const-string v1, "qop"

    invoke-direct {p0, p1, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setQop(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 481
    invoke-virtual {p0}, Lcom/ning/http/client/Realm$RealmBuilder;->getNonce()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 482
    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 486
    :goto_0
    return-object p0

    .line 484
    :cond_1
    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {p0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    goto :goto_0
.end method

.method public setAlgorithm(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "algorithm"    # Ljava/lang/String;

    .prologue
    .line 378
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->algorithm:Ljava/lang/String;

    .line 379
    return-object p0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->charset:Ljava/nio/charset/Charset;

    .line 557
    return-object p0
.end method

.method public setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 432
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->methodName:Ljava/lang/String;

    .line 433
    return-object p0
.end method

.method public setNc(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "nc"    # Ljava/lang/String;

    .prologue
    .line 414
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nc:Ljava/lang/String;

    .line 415
    return-object p0
.end method

.method public setNonce(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "nonce"    # Ljava/lang/String;

    .prologue
    .line 369
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->nonce:Ljava/lang/String;

    .line 370
    return-object p0
.end method

.method public setNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "ntlmDomain"    # Ljava/lang/String;

    .prologue
    .line 314
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmDomain:Ljava/lang/String;

    .line 315
    return-object p0
.end method

.method public setNtlmHost(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 323
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->ntlmHost:Ljava/lang/String;

    .line 324
    return-object p0
.end method

.method public setOmitQuery(Z)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "omitQuery"    # Z

    .prologue
    .line 459
    iput-boolean p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->omitQuery:Z

    .line 460
    return-object p0
.end method

.method public setOpaque(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "opaque"    # Ljava/lang/String;

    .prologue
    .line 396
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->opaque:Ljava/lang/String;

    .line 397
    return-object p0
.end method

.method public setPassword(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 342
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->password:Ljava/lang/String;

    .line 343
    return-object p0
.end method

.method public setPrincipal(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "principal"    # Ljava/lang/String;

    .prologue
    .line 333
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->principal:Ljava/lang/String;

    .line 334
    return-object p0
.end method

.method public setQop(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "qop"    # Ljava/lang/String;

    .prologue
    .line 405
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->qop:Ljava/lang/String;

    .line 406
    return-object p0
.end method

.method public setRealmName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "realmName"    # Ljava/lang/String;

    .prologue
    .line 360
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->realmName:Ljava/lang/String;

    .line 361
    return-object p0
.end method

.method public setResponse(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 387
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->response:Ljava/lang/String;

    .line 388
    return-object p0
.end method

.method public setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "scheme"    # Lcom/ning/http/client/Realm$AuthScheme;

    .prologue
    .line 351
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->scheme:Lcom/ning/http/client/Realm$AuthScheme;

    .line 352
    return-object p0
.end method

.method public setTargetProxy(Z)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "targetProxy"    # Z

    .prologue
    .line 468
    iput-boolean p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->targetProxy:Z

    .line 469
    return-object p0
.end method

.method public setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 423
    iput-object p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->uri:Lcom/ning/http/client/uri/Uri;

    .line 424
    return-object p0
.end method

.method public setUseAbsoluteURI(Z)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "useAbsoluteURI"    # Z

    .prologue
    .line 450
    iput-boolean p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->useAbsoluteURI:Z

    .line 451
    return-object p0
.end method

.method public setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 0
    .param p1, "usePreemptiveAuth"    # Z

    .prologue
    .line 441
    iput-boolean p1, p0, Lcom/ning/http/client/Realm$RealmBuilder;->usePreemptive:Z

    .line 442
    return-object p0
.end method
