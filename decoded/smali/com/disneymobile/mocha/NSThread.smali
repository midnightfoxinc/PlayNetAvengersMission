.class public Lcom/disneymobile/mocha/NSThread;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSThread.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    return-void
.end method

.method public static detachNewThreadSelectorToTargetWithObject(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p0, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 15
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/disneymobile/mocha/NSThread$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/disneymobile/mocha/NSThread$1;-><init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 27
    return-void
.end method

.method public static isMainThread()Z
    .locals 2

    .prologue
    .line 11
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
