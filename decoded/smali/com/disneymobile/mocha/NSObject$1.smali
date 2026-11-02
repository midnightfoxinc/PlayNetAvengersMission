.class final Lcom/disneymobile/mocha/NSObject$1;
.super Ljava/lang/Object;
.source "NSObject.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSObject;->performSelectorOnMainThreadWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$_this:Ljava/lang/Object;

.field final synthetic val$object:Ljava/lang/Object;

.field final synthetic val$selector:Lcom/disneymobile/mocha/support/Selector;


# direct methods
.method constructor <init>(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 29
    iput-object p1, p0, Lcom/disneymobile/mocha/NSObject$1;->val$object:Ljava/lang/Object;

    iput-object p2, p0, Lcom/disneymobile/mocha/NSObject$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    iput-object p3, p0, Lcom/disneymobile/mocha/NSObject$1;->val$_this:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 31
    iget-object v0, p0, Lcom/disneymobile/mocha/NSObject$1;->val$object:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/disneymobile/mocha/NSObject$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSObject$1;->val$_this:Ljava/lang/Object;

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v5, v1, v2}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :goto_0
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/mocha/NSObject$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSObject$1;->val$_this:Ljava/lang/Object;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/disneymobile/mocha/NSObject$1;->val$object:Ljava/lang/Object;

    aput-object v3, v2, v4

    invoke-virtual {v0, v5, v1, v2}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
