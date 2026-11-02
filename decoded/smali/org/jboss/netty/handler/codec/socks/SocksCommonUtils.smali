.class final Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;
.super Ljava/lang/Object;
.source "SocksCommonUtils.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FIRST_ADDRESS_OCTET_SHIFT:I = 0x18

.field private static final SECOND_ADDRESS_OCTET_SHIFT:I = 0x10

.field private static final THIRD_ADDRESS_OCTET_SHIFT:I = 0x8

.field public static final UNKNOWN_SOCKS_REQUEST:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

.field public static final UNKNOWN_SOCKS_RESPONSE:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

.field private static final XOR_DEFAULT_VALUE:I = 0xff

.field private static final ipv6conseqZeroFiller:[C

.field private static final ipv6hextetSeparator:C = ':'


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->$assertionsDisabled:Z

    .line 19
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/UnknownSocksRequest;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/socks/UnknownSocksRequest;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->UNKNOWN_SOCKS_REQUEST:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

    .line 20
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/UnknownSocksResponse;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/socks/UnknownSocksResponse;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->UNKNOWN_SOCKS_RESPONSE:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    .line 41
    const/4 v0, 0x2

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6conseqZeroFiller:[C

    return-void

    .line 18
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 41
    :array_0
    .array-data 2
        0x3as
        0x3as
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static intToIp(I)Ljava/lang/String;
    .locals 3
    .param p0, "i"    # I

    .prologue
    const/16 v2, 0x2e

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/lit16 v1, p0, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static ipv6toCompressedForm([B)Ljava/lang/String;
    .locals 9
    .param p0, "src"    # [B

    .prologue
    const/16 v8, 0x8

    .line 49
    sget-boolean v6, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->$assertionsDisabled:Z

    if-nez v6, :cond_0

    array-length v6, p0

    const/16 v7, 0x10

    if-eq v6, v7, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 52
    :cond_0
    const/4 v0, -0x1

    .line 54
    .local v0, "cmprHextet":I
    const/4 v1, 0x0

    .line 55
    .local v1, "cmprSize":I
    const/4 v3, 0x0

    .local v3, "hextet":I
    :goto_0
    if-ge v3, v8, :cond_3

    .line 56
    mul-int/lit8 v2, v3, 0x2

    .line 57
    .local v2, "curByte":I
    const/4 v5, 0x0

    .line 59
    .local v5, "size":I
    :goto_1
    array-length v6, p0

    if-ge v2, v6, :cond_1

    aget-byte v6, p0, v2

    if-nez v6, :cond_1

    add-int/lit8 v6, v2, 0x1

    aget-byte v6, p0, v6

    if-nez v6, :cond_1

    .line 60
    add-int/lit8 v2, v2, 0x2

    .line 61
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 63
    :cond_1
    if-le v5, v1, :cond_2

    .line 64
    move v0, v3

    .line 65
    move v1, v5

    .line 67
    :cond_2
    div-int/lit8 v6, v2, 0x2

    add-int/lit8 v3, v6, 0x1

    .line 68
    goto :goto_0

    .line 69
    .end local v2    # "curByte":I
    .end local v5    # "size":I
    :cond_3
    const/4 v6, -0x1

    if-eq v0, v6, :cond_4

    const/4 v6, 0x2

    if-ge v1, v6, :cond_5

    .line 71
    :cond_4
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6toStr([B)Ljava/lang/String;

    move-result-object v6

    .line 77
    :goto_2
    return-object v6

    .line 73
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v6, 0x27

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 74
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    invoke-static {v4, p0, v6, v0}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6toStr(Ljava/lang/StringBuilder;[BII)V

    .line 75
    sget-object v6, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6conseqZeroFiller:[C

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 76
    add-int v6, v0, v1

    invoke-static {v4, p0, v6, v8}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6toStr(Ljava/lang/StringBuilder;[BII)V

    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2
.end method

.method public static ipv6toStr([B)Ljava/lang/String;
    .locals 3
    .param p0, "src"    # [B

    .prologue
    .line 87
    sget-boolean v1, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    array-length v1, p0

    const/16 v2, 0x10

    if-eq v1, v2, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 88
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 89
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-static {v0, p0, v1, v2}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6toStr(Ljava/lang/StringBuilder;[BII)V

    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static ipv6toStr(Ljava/lang/StringBuilder;[BII)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "src"    # [B
    .param p2, "fromHextet"    # I
    .param p3, "toHextet"    # I

    .prologue
    .line 95
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 96
    shl-int/lit8 v1, v0, 0x1

    aget-byte v1, p1, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    shl-int/lit8 v2, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    add-int/lit8 v1, p3, -0x1

    if-ge v0, v1, :cond_0

    .line 99
    const/16 v1, 0x3a

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 95
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_1
    return-void
.end method
