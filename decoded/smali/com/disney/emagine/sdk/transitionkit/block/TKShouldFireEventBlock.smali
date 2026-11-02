.class public Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;
.super Ljava/lang/Object;
.source "TKShouldFireEventBlock.java"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "event"    # Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .param p2, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 10
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 16
    return-void
.end method
