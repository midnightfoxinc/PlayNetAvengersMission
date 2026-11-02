.class public final enum Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
.super Ljava/lang/Enum;
.source "SocksMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/socks/SocksMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

.field public static final enum FAILURE:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

.field public static final enum SUCCESS:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;


# instance fields
.field private final b:B


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 133
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v3, v3}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->SUCCESS:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    .line 134
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    const-string v1, "FAILURE"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v4, v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->FAILURE:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    .line 132
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->SUCCESS:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->FAILURE:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    aput-object v1, v0, v4

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

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
    .line 138
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 139
    iput-byte p3, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->b:B

    .line 140
    return-void
.end method

.method public static fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    .locals 5
    .param p0, "b"    # B

    .prologue
    .line 143
    invoke-static {}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 144
    .local v1, "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    iget-byte v4, v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->b:B

    if-ne v4, p0, :cond_0

    .line 148
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    :goto_1
    return-object v1

    .line 143
    .restart local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 148
    .end local v1    # "code":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->FAILURE:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 132
    const-class v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;
    .locals 1

    .prologue
    .line 132
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->$VALUES:[Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    return-object v0
.end method


# virtual methods
.method public getByteValue()B
    .locals 1

    .prologue
    .line 152
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->b:B

    return v0
.end method
