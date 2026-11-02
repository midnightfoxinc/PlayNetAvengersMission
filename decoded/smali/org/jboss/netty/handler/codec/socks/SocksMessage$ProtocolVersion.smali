.class public final enum Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
.super Ljava/lang/Enum;
.source "SocksMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/socks/SocksMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ProtocolVersion"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

.field public static final enum SOCKS4a:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

.field public static final enum SOCKS5:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

.field public static final enum UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;


# instance fields
.field private final b:B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 189
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    const-string v1, "SOCKS4a"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v3, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS4a:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    .line 190
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    const-string v1, "SOCKS5"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v4, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS5:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    .line 191
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    const-string v1, "UNKNOWN"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v5, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    .line 188
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS4a:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS5:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    aput-object v1, v0, v5

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0
    .param p3, "b"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)V"
        }
    .end annotation

    .prologue
    .line 195
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 196
    iput-byte p3, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->b:B

    .line 197
    return-void
.end method

.method public static fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 200
    invoke-static {}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 201
    .local v1, "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    iget-byte v4, v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->b:B

    if-ne v4, p0, :cond_0

    .line 205
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    :goto_1
    return-object v1

    .line 200
    .restart local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 205
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 188
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;
    .locals 1

    .prologue
    .line 188
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    return-object v0
.end method


# virtual methods
.method public getByteValue()B
    .locals 1

    .prologue
    .line 209
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->b:B

    return v0
.end method
