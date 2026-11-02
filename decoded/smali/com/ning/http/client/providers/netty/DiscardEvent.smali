.class public final enum Lcom/ning/http/client/providers/netty/DiscardEvent;
.super Ljava/lang/Enum;
.source "DiscardEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/providers/netty/DiscardEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/providers/netty/DiscardEvent;

.field public static final enum INSTANCE:Lcom/ning/http/client/providers/netty/DiscardEvent;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 20
    new-instance v0, Lcom/ning/http/client/providers/netty/DiscardEvent;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/netty/DiscardEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/providers/netty/DiscardEvent;->INSTANCE:Lcom/ning/http/client/providers/netty/DiscardEvent;

    .line 19
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/ning/http/client/providers/netty/DiscardEvent;

    sget-object v1, Lcom/ning/http/client/providers/netty/DiscardEvent;->INSTANCE:Lcom/ning/http/client/providers/netty/DiscardEvent;

    aput-object v1, v0, v2

    sput-object v0, Lcom/ning/http/client/providers/netty/DiscardEvent;->$VALUES:[Lcom/ning/http/client/providers/netty/DiscardEvent;

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
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/providers/netty/DiscardEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/ning/http/client/providers/netty/DiscardEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/DiscardEvent;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/providers/netty/DiscardEvent;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/ning/http/client/providers/netty/DiscardEvent;->$VALUES:[Lcom/ning/http/client/providers/netty/DiscardEvent;

    invoke-virtual {v0}, [Lcom/ning/http/client/providers/netty/DiscardEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/providers/netty/DiscardEvent;

    return-object v0
.end method
