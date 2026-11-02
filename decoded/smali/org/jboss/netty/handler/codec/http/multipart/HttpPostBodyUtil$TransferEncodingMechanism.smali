.class public final enum Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;
.super Ljava/lang/Enum;
.source "HttpPostBodyUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TransferEncodingMechanism"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

.field public static final enum BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

.field public static final enum BIT7:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

.field public static final enum BIT8:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 90
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    const-string v1, "BIT7"

    const-string v2, "7bit"

    invoke-direct {v0, v1, v3, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT7:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    .line 94
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    const-string v1, "BIT8"

    const-string v2, "8bit"

    invoke-direct {v0, v1, v4, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT8:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    .line 98
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    const-string v1, "BINARY"

    const-string v2, "binary"

    invoke-direct {v0, v1, v5, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    .line 86
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT7:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    aput-object v1, v0, v3

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT8:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    aput-object v1, v0, v5

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->$VALUES:[Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 107
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value:Ljava/lang/String;

    .line 108
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 102
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 103
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    const-class v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    return-object v0
.end method

.method public static values()[Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->$VALUES:[Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v0}, [Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value:Ljava/lang/String;

    return-object v0
.end method

.method public value()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value:Ljava/lang/String;

    return-object v0
.end method
