.class final Lcom/disneymobile/mocha/NSThread$1;
.super Ljava/lang/Object;
.source "NSThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSThread;->detachNewThreadSelectorToTargetWithObject(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$object:Ljava/lang/Object;

.field final synthetic val$selector:Lcom/disneymobile/mocha/support/Selector;

.field final synthetic val$target:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    iput-object p1, p0, Lcom/disneymobile/mocha/NSThread$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    iput-object p2, p0, Lcom/disneymobile/mocha/NSThread$1;->val$target:Ljava/lang/Object;

    iput-object p3, p0, Lcom/disneymobile/mocha/NSThread$1;->val$object:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 17
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 18
    iget-object v0, p0, Lcom/disneymobile/mocha/NSThread$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disneymobile/mocha/NSThread$1;->val$target:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disneymobile/mocha/NSThread$1;->val$object:Ljava/lang/Object;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeWithOptionalParametersWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/disneymobile/mocha/NSThread$1$1;

    invoke-direct {v1, p0}, Lcom/disneymobile/mocha/NSThread$1$1;-><init>(Lcom/disneymobile/mocha/NSThread$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 24
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 25
    return-void
.end method
