.class public final enum Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
.super Ljava/lang/Enum;
.source "SocksMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/socks/SocksMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SubnegotiationVersion"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

.field public static final enum AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

.field public static final enum UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;


# instance fields
.field private final b:B


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 214
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    const-string v1, "AUTH_PASSWORD"

    invoke-direct {v0, v1, v4, v3}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    .line 215
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    const-string v1, "UNKNOWN"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v3, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    .line 213
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    aput-object v1, v0, v3

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

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
    .line 219
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 220
    iput-byte p3, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->b:B

    .line 221
    return-void
.end method

.method public static fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 224
    invoke-static {}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 225
    .local v1, "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    iget-byte v4, v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->b:B

    if-ne v4, p0, :cond_0

    .line 229
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    :goto_1
    return-object v1

    .line 224
    .restart local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 229
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 213
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;
    .locals 1

    .prologue
    .line 213
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    return-object v0
.end method


# virtual methods
.method public getByteValue()B
    .locals 1

    .prologue
    .line 233
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->b:B

    return v0
.end method
