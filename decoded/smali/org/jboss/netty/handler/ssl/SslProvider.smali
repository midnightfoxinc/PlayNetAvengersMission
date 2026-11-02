.class public final enum Lorg/jboss/netty/handler/ssl/SslProvider;
.super Ljava/lang/Enum;
.source "SslProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/ssl/SslProvider;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/ssl/SslProvider;

.field public static final enum JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

.field public static final enum OPENSSL:Lorg/jboss/netty/handler/ssl/SslProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslProvider;

    const-string v1, "JDK"

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/ssl/SslProvider;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    .line 30
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslProvider;

    const-string v1, "OPENSSL"

    invoke-direct {v0, v1, v3}, Lorg/jboss/netty/handler/ssl/SslProvider;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->OPENSSL:Lorg/jboss/netty/handler/ssl/SslProvider;

    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/jboss/netty/handler/ssl/SslProvider;

    sget-object v1, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    aput-object v1, v0, v2

    sget-object v1, Lorg/jboss/netty/handler/ssl/SslProvider;->OPENSSL:Lorg/jboss/netty/handler/ssl/SslProvider;

    aput-object v1, v0, v3

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->$VALUES:[Lorg/jboss/netty/handler/ssl/SslProvider;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/ssl/SslProvider;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lorg/jboss/netty/handler/ssl/SslProvider;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/ssl/SslProvider;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/ssl/SslProvider;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->$VALUES:[Lorg/jboss/netty/handler/ssl/SslProvider;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/ssl/SslProvider;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/ssl/SslProvider;

    return-object v0
.end method
