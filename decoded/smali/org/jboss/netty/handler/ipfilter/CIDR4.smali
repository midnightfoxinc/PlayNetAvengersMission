.class public Lorg/jboss/netty/handler/ipfilter/CIDR4;
.super Lorg/jboss/netty/handler/ipfilter/CIDR;
.source "CIDR4.java"


# instance fields
.field private final addressEndInt:I

.field private addressInt:I


# direct methods
.method protected constructor <init>(Ljava/net/Inet4Address;I)V
    .locals 3
    .param p1, "newaddr"    # Ljava/net/Inet4Address;
    .param p2, "mask"    # I

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/jboss/netty/handler/ipfilter/CIDR;-><init>()V

    .line 33
    iput p2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    .line 34
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4AddressToInt(Ljava/net/InetAddress;)I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    .line 35
    invoke-static {p2}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4PrefixLengthToMask(I)I

    move-result v0

    .line 36
    .local v0, "newmask":I
    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    and-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    .line 38
    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    invoke-static {v1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->intToIPv4Address(I)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->baseAddress:Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :goto_0
    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    invoke-static {v2}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4PrefixLengthToLength(I)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressEndInt:I

    .line 43
    return-void

    .line 39
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static intToIPv4Address(I)Ljava/net/InetAddress;
    .locals 3
    .param p0, "addr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 127
    .local v0, "a":[B
    const/4 v1, 0x0

    shr-int/lit8 v2, p0, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 128
    const/4 v1, 0x1

    shr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 129
    const/4 v1, 0x2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 130
    const/4 v1, 0x3

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 131
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method private static ipv4AddressToInt(Ljava/net/InetAddress;)I
    .locals 2
    .param p0, "addr"    # Ljava/net/InetAddress;

    .prologue
    .line 143
    instance-of v1, p0, Ljava/net/Inet6Address;

    if-eqz v1, :cond_0

    .line 144
    check-cast p0, Ljava/net/Inet6Address;

    .end local p0    # "addr":Ljava/net/InetAddress;
    invoke-static {p0}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->getIpV4FromIpV6(Ljava/net/Inet6Address;)[B

    move-result-object v0

    .line 148
    .local v0, "address":[B
    :goto_0
    invoke-static {v0}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4AddressToInt([B)I

    move-result v1

    return v1

    .line 146
    .end local v0    # "address":[B
    .restart local p0    # "addr":Ljava/net/InetAddress;
    :cond_0
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .restart local v0    # "address":[B
    goto :goto_0
.end method

.method private static ipv4AddressToInt([B)I
    .locals 6
    .param p0, "address"    # [B

    .prologue
    .line 159
    const/4 v4, 0x0

    .line 160
    .local v4, "net":I
    move-object v1, p0

    .local v1, "arr$":[B
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-byte v0, v1, v2

    .line 161
    .local v0, "addres":B
    shl-int/lit8 v4, v4, 0x8

    .line 162
    and-int/lit16 v5, v0, 0xff

    or-int/2addr v4, v5

    .line 160
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 164
    .end local v0    # "addres":B
    :cond_0
    return v4
.end method

.method private static ipv4PrefixLengthToLength(I)I
    .locals 2
    .param p0, "prefixLength"    # I

    .prologue
    .line 109
    const/4 v0, 0x1

    rsub-int/lit8 v1, p0, 0x20

    shl-int/2addr v0, v1

    return v0
.end method

.method private static ipv4PrefixLengthToMask(I)I
    .locals 2
    .param p0, "prefixLength"    # I

    .prologue
    .line 117
    const/4 v0, 0x1

    rsub-int/lit8 v1, p0, 0x20

    shl-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    xor-int/lit8 v0, v0, -0x1

    return v0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 25
    check-cast p1, Lorg/jboss/netty/handler/ipfilter/CIDR;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->compareTo(Lorg/jboss/netty/handler/ipfilter/CIDR;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/ipfilter/CIDR;)I
    .locals 8
    .param p1, "arg"    # Lorg/jboss/netty/handler/ipfilter/CIDR;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, -0x1

    .line 56
    instance-of v3, p1, Lorg/jboss/netty/handler/ipfilter/CIDR6;

    if-eqz v3, :cond_4

    .line 57
    iget-object v3, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->baseAddress:Ljava/net/InetAddress;

    check-cast v3, Ljava/net/Inet6Address;

    invoke-static {v3}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->getIpV4FromIpV6(Ljava/net/Inet6Address;)[B

    move-result-object v0

    .line 58
    .local v0, "address":[B
    invoke-static {v0}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4AddressToInt([B)I

    move-result v1

    .line 59
    .local v1, "net":I
    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-ne v1, v3, :cond_0

    iget v3, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    iget v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    if-ne v3, v7, :cond_0

    move v3, v4

    .line 87
    .end local v0    # "address":[B
    .end local v1    # "net":I
    :goto_0
    return v3

    .line 62
    .restart local v0    # "address":[B
    .restart local v1    # "net":I
    :cond_0
    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-ge v1, v3, :cond_1

    move v3, v5

    .line 63
    goto :goto_0

    .line 65
    :cond_1
    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-le v1, v3, :cond_2

    move v3, v6

    .line 66
    goto :goto_0

    .line 68
    :cond_2
    iget v3, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    iget v4, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    if-ge v3, v4, :cond_3

    move v3, v6

    .line 69
    goto :goto_0

    :cond_3
    move v3, v5

    .line 71
    goto :goto_0

    .end local v0    # "address":[B
    .end local v1    # "net":I
    :cond_4
    move-object v2, p1

    .line 73
    check-cast v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;

    .line 74
    .local v2, "o":Lorg/jboss/netty/handler/ipfilter/CIDR4;
    iget v3, v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    iget v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-ne v3, v7, :cond_5

    iget v3, v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    iget v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    if-ne v3, v7, :cond_5

    move v3, v4

    .line 75
    goto :goto_0

    .line 77
    :cond_5
    iget v3, v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    iget v4, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-ge v3, v4, :cond_6

    move v3, v5

    .line 78
    goto :goto_0

    .line 80
    :cond_6
    iget v3, v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    iget v4, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-le v3, v4, :cond_7

    move v3, v6

    .line 81
    goto :goto_0

    .line 83
    :cond_7
    iget v3, v2, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    iget v4, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    if-ge v3, v4, :cond_8

    move v3, v6

    .line 85
    goto :goto_0

    :cond_8
    move v3, v5

    .line 87
    goto :goto_0
.end method

.method public contains(Ljava/net/InetAddress;)Z
    .locals 3
    .param p1, "inetAddress"    # Ljava/net/InetAddress;

    .prologue
    const/4 v1, 0x1

    .line 92
    if-nez p1, :cond_0

    .line 93
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "inetAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_0
    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->cidrMask:I

    if-nez v2, :cond_2

    .line 101
    :cond_1
    :goto_0
    return v1

    .line 100
    :cond_2
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->ipv4AddressToInt(Ljava/net/InetAddress;)I

    move-result v0

    .line 101
    .local v0, "search":I
    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressInt:I

    if-lt v0, v2, :cond_3

    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressEndInt:I

    if-le v0, v2, :cond_1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getEndAddress()Ljava/net/InetAddress;
    .locals 2

    .prologue
    .line 48
    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR4;->addressEndInt:I

    invoke-static {v1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;->intToIPv4Address(I)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 51
    :goto_0
    return-object v1

    .line 49
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/net/UnknownHostException;
    const/4 v1, 0x0

    goto :goto_0
.end method
