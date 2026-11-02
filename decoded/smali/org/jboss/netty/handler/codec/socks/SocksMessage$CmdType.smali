.class public final enum Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
.super Ljava/lang/Enum;
.source "SocksMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/socks/SocksMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CmdType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

.field public static final enum BIND:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

.field public static final enum CONNECT:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

.field public static final enum UDP:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

.field public static final enum UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;


# instance fields
.field private final b:B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 81
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    const-string v1, "CONNECT"

    invoke-direct {v0, v1, v6, v3}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->CONNECT:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    .line 82
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    const-string v1, "BIND"

    invoke-direct {v0, v1, v3, v4}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->BIND:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    .line 83
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    const-string v1, "UDP"

    invoke-direct {v0, v1, v4, v5}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->UDP:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    .line 84
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    const-string v1, "UNKNOWN"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v5, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    .line 80
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->CONNECT:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->BIND:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->UDP:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

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
    .line 88
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 89
    iput-byte p3, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->b:B

    .line 90
    return-void
.end method

.method public static fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 93
    invoke-static {}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 94
    .local v1, "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    iget-byte v4, v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->b:B

    if-ne v4, p0, :cond_0

    .line 98
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    :goto_1
    return-object v1

    .line 93
    .restart local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 98
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 80
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    return-object v0
.end method


# virtual methods
.method public getByteValue()B
    .locals 1

    .prologue
    .line 102
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->b:B

    return v0
.end method
