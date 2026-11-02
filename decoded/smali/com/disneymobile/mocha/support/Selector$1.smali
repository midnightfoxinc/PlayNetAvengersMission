.class Lcom/disneymobile/mocha/support/Selector$1;
.super Ljava/lang/Object;
.source "Selector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/support/Selector;->invokeInBackground(Ljava/lang/Object;[Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/support/Selector;

.field final synthetic val$parameters:[Ljava/lang/Object;

.field final synthetic val$target:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 32
    iput-object p1, p0, Lcom/disneymobile/mocha/support/Selector$1;->this$0:Lcom/disneymobile/mocha/support/Selector;

    iput-object p2, p0, Lcom/disneymobile/mocha/support/Selector$1;->val$target:Ljava/lang/Object;

    iput-object p3, p0, Lcom/disneymobile/mocha/support/Selector$1;->val$parameters:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 34
    new-instance v1, Lcom/disneymobile/mocha/support/Out;

    invoke-direct {v1}, Lcom/disneymobile/mocha/support/Out;-><init>()V

    .line 36
    .local v1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    :try_start_0
    iget-object v3, p0, Lcom/disneymobile/mocha/support/Selector$1;->this$0:Lcom/disneymobile/mocha/support/Selector;

    iget-object v4, p0, Lcom/disneymobile/mocha/support/Selector$1;->val$target:Ljava/lang/Object;

    iget-object v5, p0, Lcom/disneymobile/mocha/support/Selector$1;->val$parameters:[Ljava/lang/Object;

    invoke-virtual {v3, v1, v4, v5}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    return-void

    .line 37
    :catch_0
    move-exception v2

    .line 38
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->hasValue()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disneymobile/mocha/NSError;

    move-object v0, v3

    .line 39
    .local v0, "error":Lcom/disneymobile/mocha/NSError;
    :goto_1
    if-eqz v0, :cond_0

    .line 40
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Selector.invokeInBackground caught an exception."

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-static {v3}, Lcom/disneymobile/mocha/support/Globals;->logMochaFoundationError([Ljava/lang/Object;)V

    .line 42
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-static {v3}, Landroid/os/Process;->killProcess(I)V

    goto :goto_0

    .line 38
    .end local v0    # "error":Lcom/disneymobile/mocha/NSError;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
