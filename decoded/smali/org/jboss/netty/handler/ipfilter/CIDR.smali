.class public abstract Lorg/jboss/netty/handler/ipfilter/CIDR;
.super Ljava/lang/Object;
.source "CIDR.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jboss/netty/handler/ipfilter/CIDR;",
        ">;"
    }
.end annotation


# instance fields
.field protected baseAddress:Ljava/net/InetAddress;

.field protected cidrMask:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addressStringToInet(Ljava/lang/String;)Ljava/net/InetAddress;
    .locals 1
    .param p0, "addr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public static getIpV4FromIpV6(Ljava/net/Inet6Address;)[B
    .locals 6
    .param p0, "address"    # Ljava/net/Inet6Address;

    .prologue
    const/16 v5, 0xff

    const/16 v4, 0xb

    const/16 v3, 0xa

    .line 210
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 211
    .local v0, "baddr":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x9

    if-ge v1, v2, :cond_1

    .line 212
    aget-byte v2, v0, v1

    if-eqz v2, :cond_0

    .line 213
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "This IPv6 address cannot be used in IPv4 context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 211
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    :cond_1
    aget-byte v2, v0, v3

    if-eqz v2, :cond_2

    aget-byte v2, v0, v3

    if-ne v2, v5, :cond_3

    :cond_2
    aget-byte v2, v0, v4

    if-eqz v2, :cond_4

    aget-byte v2, v0, v4

    if-eq v2, v5, :cond_4

    .line 217
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "This IPv6 address cannot be used in IPv4 context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 219
    :cond_4
    const/4 v2, 0x4

    new-array v2, v2, [B

    const/4 v3, 0x0

    const/16 v4, 0xc

    aget-byte v4, v0, v4

    aput-byte v4, v2, v3

    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v0, v4

    aput-byte v4, v2, v3

    const/4 v3, 0x2

    const/16 v4, 0xe

    aget-byte v4, v0, v4

    aput-byte v4, v2, v3

    const/4 v3, 0x3

    const/16 v4, 0xf

    aget-byte v4, v0, v4

    aput-byte v4, v2, v3

    return-object v2
.end method

.method public static getIpV6FromIpV4(Ljava/net/Inet4Address;)[B
    .locals 7
    .param p0, "address"    # Ljava/net/Inet4Address;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 230
    invoke-virtual {p0}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v0

    .line 231
    .local v0, "baddr":[B
    const/16 v1, 0x10

    new-array v1, v1, [B

    aput-byte v3, v1, v3

    aput-byte v3, v1, v4

    aput-byte v3, v1, v5

    aput-byte v3, v1, v6

    const/4 v2, 0x4

    aput-byte v3, v1, v2

    const/4 v2, 0x5

    aput-byte v3, v1, v2

    const/4 v2, 0x6

    aput-byte v3, v1, v2

    const/4 v2, 0x7

    aput-byte v3, v1, v2

    const/16 v2, 0x8

    aput-byte v3, v1, v2

    const/16 v2, 0x9

    aput-byte v3, v1, v2

    const/16 v2, 0xa

    aput-byte v3, v1, v2

    const/16 v2, 0xb

    aput-byte v3, v1, v2

    const/16 v2, 0xc

    aget-byte v3, v0, v3

    aput-byte v3, v1, v2

    const/16 v2, 0xd

    aget-byte v3, v0, v4

    aput-byte v3, v1, v2

    const/16 v2, 0xe

    aget-byte v3, v0, v5

    aput-byte v3, v1, v2

    const/16 v2, 0xf

    aget-byte v3, v0, v6

    aput-byte v3, v1, v2

    return-object v1
.end method

.method private static getNetMask(Ljava/lang/String;)I
    .locals 6
    .param p0, "netMask"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x4

    .line 170
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, "."

    invoke-direct {v3, p0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .local v3, "nm":Ljava/util/StringTokenizer;
    const/4 v0, 0x0

    .line 172
    .local v0, "i":I
    new-array v2, v5, [I

    .line 173
    .local v2, "netmask":[I
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 174
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v2, v0

    .line 175
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :cond_0
    const/4 v1, 0x0

    .line 178
    .local v1, "mask1":I
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v5, :cond_1

    .line 179
    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->bitCount(I)I

    move-result v4

    add-int/2addr v1, v4

    .line 178
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 181
    :cond_1
    return v1
.end method

.method public static newCIDR(Ljava/lang/String;)Lorg/jboss/netty/handler/ipfilter/CIDR;
    .locals 8
    .param p0, "cidr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 89
    const/16 v5, 0x2f

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 90
    .local v4, "p":I
    if-gez v4, :cond_0

    .line 91
    new-instance v5, Ljava/net/UnknownHostException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid CIDR notation used: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 93
    :cond_0
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, "addrString":Ljava/lang/String;
    add-int/lit8 v5, v4, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, "maskString":Ljava/lang/String;
    invoke-static {v1}, Lorg/jboss/netty/handler/ipfilter/CIDR;->addressStringToInet(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 97
    .local v0, "addr":Ljava/net/InetAddress;
    const/16 v5, 0x2e

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_2

    .line 98
    const/4 v5, -0x1

    invoke-static {v3, v5}, Lorg/jboss/netty/handler/ipfilter/CIDR;->parseInt(Ljava/lang/String;I)I

    move-result v2

    .line 105
    .local v2, "mask":I
    :cond_1
    :goto_0
    if-gez v2, :cond_3

    .line 106
    new-instance v5, Ljava/net/UnknownHostException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid mask length used: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 100
    .end local v2    # "mask":I
    :cond_2
    invoke-static {v3}, Lorg/jboss/netty/handler/ipfilter/CIDR;->getNetMask(Ljava/lang/String;)I

    move-result v2

    .line 101
    .restart local v2    # "mask":I
    instance-of v5, v0, Ljava/net/Inet6Address;

    if-eqz v5, :cond_1

    .line 102
    add-int/lit8 v2, v2, 0x60

    goto :goto_0

    .line 108
    :cond_3
    invoke-static {v0, v2}, Lorg/jboss/netty/handler/ipfilter/CIDR;->newCIDR(Ljava/net/InetAddress;I)Lorg/jboss/netty/handler/ipfilter/CIDR;

    move-result-object v5

    return-object v5
.end method

.method public static newCIDR(Ljava/net/InetAddress;I)Lorg/jboss/netty/handler/ipfilter/CIDR;
    .locals 3
    .param p0, "baseAddress"    # Ljava/net/InetAddress;
    .param p1, "cidrMask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 39
    if-gez p1, :cond_0

    .line 40
    new-instance v0, Ljava/net/UnknownHostException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid mask length used: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    instance-of v0, p0, Ljava/net/Inet4Address;

    if-eqz v0, :cond_2

    .line 43
    const/16 v0, 0x20

    if-le p1, v0, :cond_1

    .line 44
    new-instance v0, Ljava/net/UnknownHostException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid mask length used: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/ipfilter/CIDR4;

    check-cast p0, Ljava/net/Inet4Address;

    .end local p0    # "baseAddress":Ljava/net/InetAddress;
    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/handler/ipfilter/CIDR4;-><init>(Ljava/net/Inet4Address;I)V

    .line 52
    :goto_0
    return-object v0

    .line 49
    .restart local p0    # "baseAddress":Ljava/net/InetAddress;
    :cond_2
    const/16 v0, 0x80

    if-le p1, v0, :cond_3

    .line 50
    new-instance v0, Ljava/net/UnknownHostException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid mask length used: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_3
    new-instance v0, Lorg/jboss/netty/handler/ipfilter/CIDR6;

    check-cast p0, Ljava/net/Inet6Address;

    .end local p0    # "baseAddress":Ljava/net/InetAddress;
    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;-><init>(Ljava/net/Inet6Address;I)V

    goto :goto_0
.end method

.method public static newCIDR(Ljava/net/InetAddress;Ljava/lang/String;)Lorg/jboss/netty/handler/ipfilter/CIDR;
    .locals 4
    .param p0, "baseAddress"    # Ljava/net/InetAddress;
    .param p1, "scidrMask"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/CIDR;->getNetMask(Ljava/lang/String;)I

    move-result v0

    .line 62
    .local v0, "cidrMask":I
    if-gez v0, :cond_0

    .line 63
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid mask length used: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_0
    instance-of v1, p0, Ljava/net/Inet4Address;

    if-eqz v1, :cond_2

    .line 66
    const/16 v1, 0x20

    if-le v0, v1, :cond_1

    .line 67
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid mask length used: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 69
    :cond_1
    new-instance v1, Lorg/jboss/netty/handler/ipfilter/CIDR4;

    check-cast p0, Ljava/net/Inet4Address;

    .end local p0    # "baseAddress":Ljava/net/InetAddress;
    invoke-direct {v1, p0, v0}, Lorg/jboss/netty/handler/ipfilter/CIDR4;-><init>(Ljava/net/Inet4Address;I)V

    .line 76
    :goto_0
    return-object v1

    .line 71
    .restart local p0    # "baseAddress":Ljava/net/InetAddress;
    :cond_2
    add-int/lit8 v0, v0, 0x60

    .line 73
    const/16 v1, 0x80

    if-le v0, v1, :cond_3

    .line 74
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid mask length used: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    :cond_3
    new-instance v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;

    check-cast p0, Ljava/net/Inet6Address;

    .end local p0    # "baseAddress":Ljava/net/InetAddress;
    invoke-direct {v1, p0, v0}, Lorg/jboss/netty/handler/ipfilter/CIDR6;-><init>(Ljava/net/Inet6Address;I)V

    goto :goto_0
.end method

.method private static parseInt(Ljava/lang/String;I)I
    .locals 2
    .param p0, "intstr"    # Ljava/lang/String;
    .param p1, "def"    # I

    .prologue
    .line 192
    if-nez p0, :cond_0

    .line 200
    .end local p1    # "def":I
    :goto_0
    return p1

    .line 196
    .restart local p1    # "def":I
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 200
    .local v1, "res":Ljava/lang/Integer;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    .line 197
    .end local v1    # "res":Ljava/lang/Integer;
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .restart local v1    # "res":Ljava/lang/Integer;
    goto :goto_1
.end method


# virtual methods
.method public abstract contains(Ljava/net/InetAddress;)Z
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 141
    instance-of v1, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;

    if-nez v1, :cond_1

    .line 144
    .end local p1    # "o":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lorg/jboss/netty/handler/ipfilter/CIDR;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/CIDR;->compareTo(Ljava/lang/Object;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getBaseAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/CIDR;->baseAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public abstract getEndAddress()Ljava/net/InetAddress;
.end method

.method public getMask()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/CIDR;->baseAddress:Ljava/net/InetAddress;

    invoke-virtual {v0}, Ljava/net/InetAddress;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR;->baseAddress:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
