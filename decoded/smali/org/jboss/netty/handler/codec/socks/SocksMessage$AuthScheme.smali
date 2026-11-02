.class public final enum Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
.super Ljava/lang/Enum;
.source "SocksMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/socks/SocksMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthScheme"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

.field public static final enum AUTH_GSSAPI:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

.field public static final enum AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

.field public static final enum NO_AUTH:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

.field public static final enum UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;


# instance fields
.field private final b:B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 55
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    const-string v1, "NO_AUTH"

    invoke-direct {v0, v1, v3, v3}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->NO_AUTH:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 56
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    const-string v1, "AUTH_GSSAPI"

    invoke-direct {v0, v1, v4, v4}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->AUTH_GSSAPI:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 57
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    const-string v1, "AUTH_PASSWORD"

    invoke-direct {v0, v1, v5, v5}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 58
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    const-string v1, "UNKNOWN"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v6, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 54
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->NO_AUTH:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->AUTH_GSSAPI:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    aput-object v1, v0, v6

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

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
    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 63
    iput-byte p3, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->b:B

    .line 64
    return-void
.end method

.method public static fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 67
    invoke-static {}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 68
    .local v1, "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    iget-byte v4, v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->b:B

    if-ne v4, p0, :cond_0

    .line 72
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    :goto_1
    return-object v1

    .line 67
    .restart local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 72
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 54
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    return-object v0
.end method


# virtual methods
.method public getByteValue()B
    .locals 1

    .prologue
    .line 76
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->b:B

    return v0
.end method
