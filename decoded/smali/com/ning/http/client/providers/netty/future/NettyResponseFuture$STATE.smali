.class public final enum Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;
.super Ljava/lang/Enum;
.source "NettyResponseFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

.field public static final enum CLOSED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

.field public static final enum NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

.field public static final enum POOLED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

.field public static final enum RECONNECTED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 55
    new-instance v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    new-instance v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    const-string v1, "POOLED"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->POOLED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    new-instance v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    const-string v1, "RECONNECTED"

    invoke-direct {v0, v1, v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->RECONNECTED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    new-instance v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    const-string v1, "CLOSED"

    invoke-direct {v0, v1, v5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->CLOSED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    .line 54
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->POOLED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->RECONNECTED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->CLOSED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    aput-object v1, v0, v5

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->$VALUES:[Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

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
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 54
    const-class v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->$VALUES:[Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {v0}, [Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    return-object v0
.end method
