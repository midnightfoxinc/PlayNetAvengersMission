.class public Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;
.super Ljava/lang/Object;
.source "IpV4Subnet.java"

# interfaces
.implements Lorg/jboss/netty/handler/ipfilter/IpSet;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/handler/ipfilter/IpSet;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;",
        ">;"
    }
.end annotation


# static fields
.field private static final BYTE_ADDRESS_MASK:I = 0xff

.field private static final SUBNET_MASK:I = -0x80000000

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private cidrMask:I

.field private inetAddress:Ljava/net/InetAddress;

.field private mask:I

.field private subnet:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->mask:I

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->inetAddress:Ljava/net/InetAddress;

    .line 68
    iput v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    .line 69
    iput v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "netAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetAddress(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 0
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "cidrNetMask"    # I

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetAddress(Ljava/net/InetAddress;I)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Ljava/lang/String;)V
    .locals 0
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "netMask"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetAddress(Ljava/net/InetAddress;Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method private setCidrNetMask(I)V
    .locals 2
    .param p1, "cidrNetMask"    # I

    .prologue
    .line 188
    iput p1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    .line 189
    const/high16 v0, -0x80000000

    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    add-int/lit8 v1, v1, -0x1

    shr-int/2addr v0, v1

    iput v0, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->mask:I

    .line 190
    return-void
.end method

.method private setNetAddress(Ljava/lang/String;)V
    .locals 5
    .param p1, "netAddress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 102
    const/16 v1, 0x2f

    invoke-static {p1, v1}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "tokens":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 104
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "netAddress: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: CIDR or Decimal Notation)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_0
    aget-object v1, v0, v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    .line 108
    aget-object v1, v0, v4

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetId(Ljava/lang/String;)V

    .line 109
    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setCidrNetMask(I)V

    .line 114
    :goto_0
    return-void

    .line 111
    :cond_1
    aget-object v1, v0, v4

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetId(Ljava/lang/String;)V

    .line 112
    aget-object v1, v0, v3

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetMask(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setNetAddress(Ljava/net/InetAddress;I)V
    .locals 0
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "cidrNetMask"    # I

    .prologue
    .line 118
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetId(Ljava/net/InetAddress;)V

    .line 119
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setCidrNetMask(I)V

    .line 120
    return-void
.end method

.method private setNetAddress(Ljava/net/InetAddress;Ljava/lang/String;)V
    .locals 0
    .param p1, "inetAddress"    # Ljava/net/InetAddress;
    .param p2, "netMask"    # Ljava/lang/String;

    .prologue
    .line 124
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetId(Ljava/net/InetAddress;)V

    .line 125
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetMask(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method private setNetId(Ljava/lang/String;)V
    .locals 1
    .param p1, "netId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 136
    .local v0, "inetAddress1":Ljava/net/InetAddress;
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setNetId(Ljava/net/InetAddress;)V

    .line 137
    return-void
.end method

.method private setNetId(Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "inetAddress"    # Ljava/net/InetAddress;

    .prologue
    .line 156
    iput-object p1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->inetAddress:Ljava/net/InetAddress;

    .line 157
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->toInt(Ljava/net/InetAddress;)I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    .line 158
    return-void
.end method

.method private setNetMask(Ljava/lang/String;)V
    .locals 6
    .param p1, "netMask"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x4

    .line 167
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, "."

    invoke-direct {v3, p1, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .local v3, "nm":Ljava/util/StringTokenizer;
    const/4 v0, 0x0

    .line 169
    .local v0, "i":I
    new-array v2, v5, [I

    .line 170
    .local v2, "netmask":[I
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 171
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v2, v0

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 174
    :cond_0
    const/4 v1, 0x0

    .line 175
    .local v1, "mask1":I
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v5, :cond_1

    .line 176
    aget v4, v2, v0

    invoke-static {v4}, Ljava/lang/Integer;->bitCount(I)I

    move-result v4

    add-int/2addr v1, v4

    .line 175
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 178
    :cond_1
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->setCidrNetMask(I)V

    .line 179
    return-void
.end method

.method private static toInt(Ljava/net/InetAddress;)I
    .locals 7
    .param p0, "inetAddress1"    # Ljava/net/InetAddress;

    .prologue
    .line 145
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v1

    .line 146
    .local v1, "address":[B
    const/4 v5, 0x0

    .line 147
    .local v5, "net":I
    move-object v2, v1

    .local v2, "arr$":[B
    array-length v4, v2

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-byte v0, v2, v3

    .line 148
    .local v0, "addres":B
    shl-int/lit8 v5, v5, 0x8

    .line 149
    and-int/lit16 v6, v0, 0xff

    or-int/2addr v5, v6

    .line 147
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 151
    .end local v0    # "addres":B
    :cond_0
    return v5
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 45
    check-cast p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->compareTo(Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;)I
    .locals 4
    .param p1, "o"    # Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;

    .prologue
    const/4 v0, 0x1

    const/4 v1, -0x1

    .line 241
    iget v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    if-ne v2, v3, :cond_1

    iget v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    if-ne v2, v3, :cond_1

    .line 242
    const/4 v0, 0x0

    .line 254
    :cond_0
    :goto_0
    return v0

    .line 244
    :cond_1
    iget v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    if-lt v2, v3, :cond_0

    .line 247
    iget v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    if-le v2, v3, :cond_2

    move v0, v1

    .line 248
    goto :goto_0

    .line 250
    :cond_2
    iget v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    if-ge v2, v3, :cond_0

    move v0, v1

    .line 252
    goto :goto_0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .param p1, "ipAddr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 202
    .local v0, "inetAddress1":Ljava/net/InetAddress;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->contains(Ljava/net/InetAddress;)Z

    move-result v1

    return v1
.end method

.method public contains(Ljava/net/InetAddress;)Z
    .locals 3
    .param p1, "inetAddress1"    # Ljava/net/InetAddress;

    .prologue
    const/4 v0, 0x1

    .line 213
    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->mask:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 217
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->toInt(Ljava/net/InetAddress;)I

    move-result v1

    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->mask:I

    and-int/2addr v1, v2

    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    if-eq v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 227
    instance-of v2, p1, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;

    if-nez v2, :cond_1

    .line 231
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 230
    check-cast v0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;

    .line 231
    .local v0, "ipV4Subnet":Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;
    iget v2, v0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    if-ne v2, v3, :cond_0

    iget v2, v0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    iget v3, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 236
    iget v0, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->subnet:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 222
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->inetAddress:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/jboss/netty/handler/ipfilter/IpV4Subnet;->cidrMask:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
