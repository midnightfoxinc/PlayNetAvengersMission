.class public final Lcom/ning/http/client/ntlm/NTLMEngine;
.super Ljava/lang/Object;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/ntlm/NTLMEngine$1;,
        Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;,
        Lcom/ning/http/client/ntlm/NTLMEngine$MD4;,
        Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;,
        Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;,
        Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;,
        Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;,
        Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;
    }
.end annotation


# static fields
.field private static final FLAG_DOMAIN_PRESENT:I = 0x1000

.field private static final FLAG_REQUEST_128BIT_KEY_EXCH:I = 0x20000000

.field private static final FLAG_REQUEST_56BIT_ENCRYPTION:I = -0x80000000

.field private static final FLAG_REQUEST_ALWAYS_SIGN:I = 0x8000

.field private static final FLAG_REQUEST_EXPLICIT_KEY_EXCH:I = 0x40000000

.field private static final FLAG_REQUEST_LAN_MANAGER_KEY:I = 0x80

.field private static final FLAG_REQUEST_NTLM2_SESSION:I = 0x80000

.field private static final FLAG_REQUEST_NTLMv1:I = 0x200

.field private static final FLAG_REQUEST_SEAL:I = 0x20

.field private static final FLAG_REQUEST_SIGN:I = 0x10

.field private static final FLAG_REQUEST_TARGET:I = 0x4

.field private static final FLAG_REQUEST_UNICODE_ENCODING:I = 0x1

.field private static final FLAG_REQUEST_VERSION:I = 0x2000000

.field private static final FLAG_TARGETINFO_PRESENT:I = 0x800000

.field private static final FLAG_WORKSTATION_PRESENT:I = 0x2000

.field public static final INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

.field private static final MAGIC_CONSTANT:[B

.field private static final RND_GEN:Ljava/security/SecureRandom;

.field private static final SIGNATURE:[B

.field private static final TYPE_1_MESSAGE:Ljava/lang/String;

.field private static final UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 53
    new-instance v4, Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-direct {v4}, Lcom/ning/http/client/ntlm/NTLMEngine;-><init>()V

    sput-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

    .line 61
    :try_start_0
    const-string v4, "UnicodeLittleUnmarked"

    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_0
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 65
    .local v1, "c":Ljava/nio/charset/Charset;
    :goto_0
    sput-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    .line 68
    const-string v4, "KGS!@#$%"

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    sput-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->MAGIC_CONSTANT:[B

    .line 93
    const/4 v3, 0x0

    .line 95
    .local v3, "rnd":Ljava/security/SecureRandom;
    :try_start_1
    const-string v4, "SHA1PRNG"

    invoke-static {v4}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 98
    :goto_1
    sput-object v3, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    .line 105
    const-string v4, "NTLMSSP"

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 106
    .local v0, "bytesWithoutNull":[B
    array-length v4, v0

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [B

    sput-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->SIGNATURE:[B

    .line 107
    sget-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->SIGNATURE:[B

    array-length v5, v0

    invoke-static {v0, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    sget-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->SIGNATURE:[B

    array-length v5, v0

    aput-byte v6, v4, v5

    .line 111
    new-instance v4, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;-><init>(Lcom/ning/http/client/ntlm/NTLMEngine$1;)V

    invoke-virtual {v4}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->getResponse()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->TYPE_1_MESSAGE:Ljava/lang/String;

    return-void

    .line 62
    .end local v0    # "bytesWithoutNull":[B
    .end local v1    # "c":Ljava/nio/charset/Charset;
    .end local v3    # "rnd":Ljava/security/SecureRandom;
    :catch_0
    move-exception v2

    .line 63
    .local v2, "e":Ljava/nio/charset/UnsupportedCharsetException;
    const/4 v1, 0x0

    .restart local v1    # "c":Ljava/nio/charset/Charset;
    goto :goto_0

    .line 96
    .end local v2    # "e":Ljava/nio/charset/UnsupportedCharsetException;
    .restart local v3    # "rnd":Ljava/security/SecureRandom;
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1457
    return-void
.end method

.method static F(III)I
    .locals 2
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I

    .prologue
    .line 1274
    and-int v0, p0, p1

    xor-int/lit8 v1, p0, -0x1

    and-int/2addr v1, p2

    or-int/2addr v0, v1

    return v0
.end method

.method static G(III)I
    .locals 2
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I

    .prologue
    .line 1278
    and-int v0, p0, p1

    and-int v1, p0, p2

    or-int/2addr v0, v1

    and-int v1, p1, p2

    or-int/2addr v0, v1

    return v0
.end method

.method static H(III)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I

    .prologue
    .line 1282
    xor-int v0, p0, p1

    xor-int/2addr v0, p2

    return v0
.end method

.method private static RC4([B[B)[B
    .locals 5
    .param p0, "value"    # [B
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 474
    :try_start_0
    const-string v2, "RC4"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 475
    .local v1, "rc4":Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "RC4"

    invoke-direct {v3, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 476
    invoke-virtual {v1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 477
    .end local v1    # "rc4":Ljavax/crypto/Cipher;
    :catch_0
    move-exception v0

    .line 478
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method static synthetic access$100()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->makeRandomChallenge()[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000([B[B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1, p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->ntlm2SessionResponse([B[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100([B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->hmacMD5([B[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200([BI)Ljava/security/Key;
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300()[B
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/ning/http/client/ntlm/NTLMEngine;->SIGNATURE:[B

    return-object v0
.end method

.method static synthetic access$1400([BI)I
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->readUShort([BI)I

    move-result v0

    return v0
.end method

.method static synthetic access$1500([BI)I
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->readULong([BI)I

    move-result v0

    return v0
.end method

.method static synthetic access$1600([BI)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->readSecurityBuffer([BI)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->convertHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->convertDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1900([B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->RC4([B[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->makeSecondaryKey()[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2000()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->lmHash(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400([B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->lmResponse([B[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->ntlmHash(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1, p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->lmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1, p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->ntlmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800([B[B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # [B

    .prologue
    .line 51
    invoke-static {p0, p1, p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->createBlob([B[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900([B[B[B)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0, p1, p2}, Lcom/ning/http/client/ntlm/NTLMEngine;->lmv2Response([B[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method private static convertDomain(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "domain"    # Ljava/lang/String;

    .prologue
    .line 157
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static convertHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 152
    invoke-static {p0}, Lcom/ning/http/client/ntlm/NTLMEngine;->stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static createBlob([B[B[B)[B
    .locals 9
    .param p0, "clientChallenge"    # [B
    .param p1, "targetInformation"    # [B
    .param p2, "timestamp"    # [B

    .prologue
    const/4 v6, 0x4

    const/4 v8, 0x0

    .line 681
    new-array v1, v6, [B

    fill-array-data v1, :array_0

    .line 682
    .local v1, "blobSignature":[B
    new-array v3, v6, [B

    fill-array-data v3, :array_1

    .line 683
    .local v3, "reserved":[B
    new-array v4, v6, [B

    fill-array-data v4, :array_2

    .line 684
    .local v4, "unknown1":[B
    new-array v5, v6, [B

    fill-array-data v5, :array_3

    .line 685
    .local v5, "unknown2":[B
    array-length v6, v1

    array-length v7, v3

    add-int/2addr v6, v7

    array-length v7, p2

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x8

    array-length v7, v4

    add-int/2addr v6, v7

    array-length v7, p1

    add-int/2addr v6, v7

    array-length v7, v5

    add-int/2addr v6, v7

    new-array v0, v6, [B

    .line 687
    .local v0, "blob":[B
    const/4 v2, 0x0

    .line 688
    .local v2, "offset":I
    array-length v6, v1

    invoke-static {v1, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 689
    array-length v6, v1

    add-int/2addr v2, v6

    .line 690
    array-length v6, v3

    invoke-static {v3, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 691
    array-length v6, v3

    add-int/2addr v2, v6

    .line 692
    array-length v6, p2

    invoke-static {p2, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 693
    array-length v6, p2

    add-int/2addr v2, v6

    .line 694
    const/16 v6, 0x8

    invoke-static {p0, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 695
    add-int/lit8 v2, v2, 0x8

    .line 696
    array-length v6, v4

    invoke-static {v4, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 697
    array-length v6, v4

    add-int/2addr v2, v6

    .line 698
    array-length v6, p1

    invoke-static {p1, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 699
    array-length v6, p1

    add-int/2addr v2, v6

    .line 700
    array-length v6, v5

    invoke-static {v5, v8, v0, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 701
    array-length v6, v5

    add-int/2addr v2, v6

    .line 702
    return-object v0

    .line 681
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 682
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 683
    :array_2
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 684
    :array_3
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private static createDESKey([BI)Ljava/security/Key;
    .locals 8
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 718
    const/4 v2, 0x7

    new-array v0, v2, [B

    .line 719
    .local v0, "keyBytes":[B
    const/4 v2, 0x7

    invoke-static {p0, p1, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 720
    const/16 v2, 0x8

    new-array v1, v2, [B

    .line 721
    .local v1, "material":[B
    aget-byte v2, v0, v3

    aput-byte v2, v1, v3

    .line 722
    aget-byte v2, v0, v3

    shl-int/lit8 v2, v2, 0x7

    aget-byte v3, v0, v4

    and-int/lit16 v3, v3, 0xff

    ushr-int/lit8 v3, v3, 0x1

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v4

    .line 723
    aget-byte v2, v0, v4

    shl-int/lit8 v2, v2, 0x6

    aget-byte v3, v0, v5

    and-int/lit16 v3, v3, 0xff

    ushr-int/lit8 v3, v3, 0x2

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v5

    .line 724
    aget-byte v2, v0, v5

    shl-int/lit8 v2, v2, 0x5

    aget-byte v3, v0, v6

    and-int/lit16 v3, v3, 0xff

    ushr-int/lit8 v3, v3, 0x3

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v6

    .line 725
    aget-byte v2, v0, v6

    shl-int/lit8 v2, v2, 0x4

    aget-byte v3, v0, v7

    and-int/lit16 v3, v3, 0xff

    ushr-int/lit8 v3, v3, 0x4

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v7

    .line 726
    const/4 v2, 0x5

    aget-byte v3, v0, v7

    shl-int/lit8 v3, v3, 0x3

    const/4 v4, 0x5

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    ushr-int/lit8 v4, v4, 0x5

    or-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 727
    const/4 v2, 0x6

    const/4 v3, 0x5

    aget-byte v3, v0, v3

    shl-int/lit8 v3, v3, 0x2

    const/4 v4, 0x6

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    ushr-int/lit8 v4, v4, 0x6

    or-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 728
    const/4 v2, 0x7

    const/4 v3, 0x6

    aget-byte v3, v0, v3

    shl-int/lit8 v3, v3, 0x1

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 729
    invoke-static {v1}, Lcom/ning/http/client/ntlm/NTLMEngine;->oddParity([B)V

    .line 730
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "DES"

    invoke-direct {v2, v1, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    return-object v2
.end method

.method private getType3Message(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)Ljava/lang/String;
    .locals 9
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;
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
    .line 135
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;

    move-object v1, p4

    move-object v2, p3

    move-object v3, p1

    move-object v4, p2

    move-object v5, p5

    move v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)V

    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$Type3Message;->getResponse()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static hmacMD5([B[B)[B
    .locals 2
    .param p0, "value"    # [B
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 466
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;

    invoke-direct {v0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;-><init>([B)V

    .line 467
    .local v0, "hmacMD5":Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;
    invoke-virtual {v0, p0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 468
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->getOutput()[B

    move-result-object v1

    return-object v1
.end method

.method private static lmHash(Ljava/lang/String;)[B
    .locals 13
    .param p0, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 533
    :try_start_0
    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    sget-object v11, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v9

    .line 534
    .local v9, "oemPassword":[B
    array-length v10, v9

    const/16 v11, 0xe

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 535
    .local v5, "length":I
    const/16 v10, 0xe

    new-array v4, v10, [B

    .line 536
    .local v4, "keyBytes":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v4, v11, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 537
    const/4 v10, 0x0

    invoke-static {v4, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v8

    .line 538
    .local v8, "lowKey":Ljava/security/Key;
    const/4 v10, 0x7

    invoke-static {v4, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v3

    .line 539
    .local v3, "highKey":Ljava/security/Key;
    const-string v10, "DES/ECB/NoPadding"

    invoke-static {v10}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 540
    .local v0, "des":Ljavax/crypto/Cipher;
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 541
    sget-object v10, Lcom/ning/http/client/ntlm/NTLMEngine;->MAGIC_CONSTANT:[B

    invoke-virtual {v0, v10}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v7

    .line 542
    .local v7, "lowHash":[B
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 543
    sget-object v10, Lcom/ning/http/client/ntlm/NTLMEngine;->MAGIC_CONSTANT:[B

    invoke-virtual {v0, v10}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2

    .line 544
    .local v2, "highHash":[B
    const/16 v10, 0x10

    new-array v6, v10, [B

    .line 545
    .local v6, "lmHash":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v7, v10, v6, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 546
    const/4 v10, 0x0

    const/16 v11, 0x8

    const/16 v12, 0x8

    invoke-static {v2, v10, v6, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 547
    return-object v6

    .line 548
    .end local v0    # "des":Ljavax/crypto/Cipher;
    .end local v2    # "highHash":[B
    .end local v3    # "highKey":Ljava/security/Key;
    .end local v4    # "keyBytes":[B
    .end local v5    # "length":I
    .end local v6    # "lmHash":[B
    .end local v7    # "lowHash":[B
    .end local v8    # "lowKey":Ljava/security/Key;
    .end local v9    # "oemPassword":[B
    :catch_0
    move-exception v1

    .line 549
    .local v1, "e":Ljava/lang/Exception;
    new-instance v10, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
.end method

.method private static lmResponse([B[B)[B
    .locals 13
    .param p0, "hash"    # [B
    .param p1, "challenge"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 622
    const/16 v10, 0x15

    :try_start_0
    new-array v4, v10, [B

    .line 623
    .local v4, "keyBytes":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x10

    invoke-static {p0, v10, v4, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 624
    const/4 v10, 0x0

    invoke-static {v4, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v6

    .line 625
    .local v6, "lowKey":Ljava/security/Key;
    const/4 v10, 0x7

    invoke-static {v4, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v8

    .line 626
    .local v8, "middleKey":Ljava/security/Key;
    const/16 v10, 0xe

    invoke-static {v4, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->createDESKey([BI)Ljava/security/Key;

    move-result-object v2

    .line 627
    .local v2, "highKey":Ljava/security/Key;
    const-string v10, "DES/ECB/NoPadding"

    invoke-static {v10}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 628
    .local v0, "des":Ljavax/crypto/Cipher;
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 629
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v7

    .line 630
    .local v7, "lowResponse":[B
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 631
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v9

    .line 632
    .local v9, "middleResponse":[B
    const/4 v10, 0x1

    invoke-virtual {v0, v10, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 633
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 634
    .local v3, "highResponse":[B
    const/16 v10, 0x18

    new-array v5, v10, [B

    .line 635
    .local v5, "lmResponse":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v7, v10, v5, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 636
    const/4 v10, 0x0

    const/16 v11, 0x8

    const/16 v12, 0x8

    invoke-static {v9, v10, v5, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 637
    const/4 v10, 0x0

    const/16 v11, 0x10

    const/16 v12, 0x8

    invoke-static {v3, v10, v5, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 638
    return-object v5

    .line 639
    .end local v0    # "des":Ljavax/crypto/Cipher;
    .end local v2    # "highKey":Ljava/security/Key;
    .end local v3    # "highResponse":[B
    .end local v4    # "keyBytes":[B
    .end local v5    # "lmResponse":[B
    .end local v6    # "lowKey":Ljava/security/Key;
    .end local v7    # "lowResponse":[B
    .end local v8    # "middleKey":Ljava/security/Key;
    .end local v9    # "middleResponse":[B
    :catch_0
    move-exception v1

    .line 640
    .local v1, "e":Ljava/lang/Exception;
    new-instance v10, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
.end method

.method private static lmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 3
    .param p0, "domain"    # Ljava/lang/String;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "ntlmHash"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 579
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-nez v1, :cond_0

    .line 580
    new-instance v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v2, "Unicode not supported"

    invoke-direct {v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 582
    :cond_0
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;

    invoke-direct {v0, p2}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;-><init>([B)V

    .line 584
    .local v0, "hmacMD5":Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 585
    if-eqz p0, :cond_1

    .line 586
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 588
    :cond_1
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->getOutput()[B

    move-result-object v1

    return-object v1
.end method

.method private static lmv2Response([B[B[B)[B
    .locals 6
    .param p0, "hash"    # [B
    .param p1, "challenge"    # [B
    .param p2, "clientData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 659
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;

    invoke-direct {v0, p0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;-><init>([B)V

    .line 660
    .local v0, "hmacMD5":Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;
    invoke-virtual {v0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 661
    invoke-virtual {v0, p2}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 662
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->getOutput()[B

    move-result-object v2

    .line 663
    .local v2, "mac":[B
    array-length v3, v2

    array-length v4, p2

    add-int/2addr v3, v4

    new-array v1, v3, [B

    .line 664
    .local v1, "lmv2Response":[B
    array-length v3, v2

    invoke-static {v2, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 665
    array-length v3, v2

    array-length v4, p2

    invoke-static {p2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 666
    return-object v1
.end method

.method private static makeRandomChallenge()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 187
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    if-nez v1, :cond_0

    .line 188
    new-instance v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v2, "Random generator not available"

    invoke-direct {v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 190
    :cond_0
    const/16 v1, 0x8

    new-array v0, v1, [B

    .line 191
    .local v0, "rval":[B
    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    monitor-enter v2

    .line 192
    :try_start_0
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 193
    monitor-exit v2

    .line 194
    return-object v0

    .line 193
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static makeSecondaryKey()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 199
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    if-nez v1, :cond_0

    .line 200
    new-instance v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v2, "Random generator not available"

    invoke-direct {v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 202
    :cond_0
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 203
    .local v0, "rval":[B
    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    monitor-enter v2

    .line 204
    :try_start_0
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->RND_GEN:Ljava/security/SecureRandom;

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 205
    monitor-exit v2

    .line 206
    return-object v0

    .line 205
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static ntlm2SessionResponse([B[B[B)[B
    .locals 7
    .param p0, "ntlmHash"    # [B
    .param p1, "challenge"    # [B
    .param p2, "clientChallenge"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 506
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 507
    .local v2, "md5":Ljava/security/MessageDigest;
    invoke-virtual {v2, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 508
    invoke-virtual {v2, p2}, Ljava/security/MessageDigest;->update([B)V

    .line 509
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 511
    .local v0, "digest":[B
    const/16 v4, 0x8

    new-array v3, v4, [B

    .line 512
    .local v3, "sessionHash":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x8

    invoke-static {v0, v4, v3, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 513
    invoke-static {p0, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->lmResponse([B[B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 514
    .end local v0    # "digest":[B
    .end local v2    # "md5":Ljava/security/MessageDigest;
    .end local v3    # "sessionHash":[B
    :catch_0
    move-exception v1

    .line 515
    .local v1, "e":Ljava/lang/Exception;
    instance-of v4, v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    if-eqz v4, :cond_0

    .line 516
    check-cast v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 518
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v4, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static ntlmHash(Ljava/lang/String;)[B
    .locals 4
    .param p0, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 563
    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-nez v2, :cond_0

    .line 564
    new-instance v2, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v3, "Unicode not supported"

    invoke-direct {v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 566
    :cond_0
    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 567
    .local v1, "unicodePassword":[B
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;

    invoke-direct {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;-><init>()V

    .line 568
    .local v0, "md4":Lcom/ning/http/client/ntlm/NTLMEngine$MD4;
    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->update([B)V

    .line 569
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->getOutput()[B

    move-result-object v2

    return-object v2
.end method

.method private static ntlmv2Hash(Ljava/lang/String;Ljava/lang/String;[B)[B
    .locals 3
    .param p0, "domain"    # Ljava/lang/String;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "ntlmHash"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 598
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    if-nez v1, :cond_0

    .line 599
    new-instance v1, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v2, "Unicode not supported"

    invoke-direct {v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 601
    :cond_0
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;

    invoke-direct {v0, p2}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;-><init>([B)V

    .line 603
    .local v0, "hmacMD5":Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 604
    if-eqz p0, :cond_1

    .line 605
    sget-object v1, Lcom/ning/http/client/ntlm/NTLMEngine;->UNICODE_LITTLE_UNMARKED:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->update([B)V

    .line 607
    :cond_1
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->getOutput()[B

    move-result-object v1

    return-object v1
.end method

.method private static oddParity([B)V
    .locals 5
    .param p0, "bytes"    # [B

    .prologue
    .line 740
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_2

    .line 741
    aget-byte v0, p0, v1

    .line 742
    .local v0, "b":B
    ushr-int/lit8 v3, v0, 0x7

    ushr-int/lit8 v4, v0, 0x6

    xor-int/2addr v3, v4

    ushr-int/lit8 v4, v0, 0x5

    xor-int/2addr v3, v4

    ushr-int/lit8 v4, v0, 0x4

    xor-int/2addr v3, v4

    ushr-int/lit8 v4, v0, 0x3

    xor-int/2addr v3, v4

    ushr-int/lit8 v4, v0, 0x2

    xor-int/2addr v3, v4

    ushr-int/lit8 v4, v0, 0x1

    xor-int/2addr v3, v4

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_0

    const/4 v2, 0x1

    .line 743
    .local v2, "needsParity":Z
    :goto_1
    if-eqz v2, :cond_1

    .line 744
    aget-byte v3, p0, v1

    or-int/lit8 v3, v3, 0x1

    int-to-byte v3, v3

    aput-byte v3, p0, v1

    .line 740
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 742
    .end local v2    # "needsParity":Z
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 746
    .restart local v2    # "needsParity":Z
    :cond_1
    aget-byte v3, p0, v1

    and-int/lit8 v3, v3, -0x2

    int-to-byte v3, v3

    aput-byte v3, p0, v1

    goto :goto_2

    .line 749
    .end local v0    # "b":B
    .end local v2    # "needsParity":Z
    :cond_2
    return-void
.end method

.method private static readSecurityBuffer([BI)[B
    .locals 5
    .param p0, "src"    # [B
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-static {p0, p1}, Lcom/ning/http/client/ntlm/NTLMEngine;->readUShort([BI)I

    move-result v1

    .line 176
    .local v1, "length":I
    add-int/lit8 v3, p1, 0x4

    invoke-static {p0, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->readULong([BI)I

    move-result v2

    .line 177
    .local v2, "offset":I
    array-length v3, p0

    add-int v4, v2, v1

    if-ge v3, v4, :cond_0

    .line 178
    new-instance v3, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v4, "NTLM authentication - buffer too small for data item"

    invoke-direct {v3, v4}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 180
    :cond_0
    new-array v0, v1, [B

    .line 181
    .local v0, "buffer":[B
    const/4 v3, 0x0

    invoke-static {p0, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 182
    return-object v0
.end method

.method private static readULong([BI)I
    .locals 2
    .param p0, "src"    # [B
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 161
    array-length v0, p0

    add-int/lit8 v1, p1, 0x4

    if-ge v0, v1, :cond_0

    .line 162
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v1, "NTLM authentication - buffer too small for DWORD"

    invoke-direct {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method private static readUShort([BI)I
    .locals 2
    .param p0, "src"    # [B
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 168
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-ge v0, v1, :cond_0

    .line 169
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngineException;

    const-string v1, "NTLM authentication - buffer too small for WORD"

    invoke-direct {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method static rotintlft(II)I
    .locals 2
    .param p0, "val"    # I
    .param p1, "numbits"    # I

    .prologue
    .line 1286
    shl-int v0, p0, p1

    rsub-int/lit8 v1, p1, 0x20

    ushr-int v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method private static stripDotSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 140
    if-nez p0, :cond_1

    .line 141
    const/4 p0, 0x0

    .line 147
    .end local p0    # "value":Ljava/lang/String;
    .local v0, "index":I
    :cond_0
    :goto_0
    return-object p0

    .line 143
    .end local v0    # "index":I
    .restart local p0    # "value":Ljava/lang/String;
    :cond_1
    const-string v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 144
    .restart local v0    # "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 145
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method static writeULong([BII)V
    .locals 2
    .param p0, "buffer"    # [B
    .param p1, "value"    # I
    .param p2, "offset"    # I

    .prologue
    .line 1267
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p2

    .line 1268
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1269
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1270
    add-int/lit8 v0, p2, 0x3

    shr-int/lit8 v1, p1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1271
    return-void
.end method


# virtual methods
.method public generateType1Msg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1522
    sget-object v0, Lcom/ning/http/client/ntlm/NTLMEngine;->TYPE_1_MESSAGE:Ljava/lang/String;

    return-object v0
.end method

.method public generateType3Msg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "domain"    # Ljava/lang/String;
    .param p4, "workstation"    # Ljava/lang/String;
    .param p5, "challenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 1527
    new-instance v9, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;

    invoke-direct {v9, p5}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;-><init>(Ljava/lang/String;)V

    .line 1528
    .local v9, "t2m":Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;
    invoke-virtual {v9}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getChallenge()[B

    move-result-object v5

    invoke-virtual {v9}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getFlags()I

    move-result v6

    invoke-virtual {v9}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getTarget()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getTargetInfo()[B

    move-result-object v8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move-object v4, p3

    invoke-direct/range {v0 .. v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->getType3Message(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
