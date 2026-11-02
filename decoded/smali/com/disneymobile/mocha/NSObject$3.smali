.class final Lcom/disneymobile/mocha/NSObject$3;
.super Ljava/lang/Object;
.source "NSObject.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSObject;->performSelectorWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;D)V
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
.method constructor <init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 78
    iput-object p1, p0, Lcom/disneymobile/mocha/NSObject$3;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    iput-object p2, p0, Lcom/disneymobile/mocha/NSObject$3;->val$_this:Ljava/lang/Object;

    iput-object p3, p0, Lcom/disneymobile/mocha/NSObject$3;->val$object:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 80
    iget-object v0, p0, Lcom/disneymobile/mocha/NSObject$3;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disneymobile/mocha/NSObject$3;->val$_this:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disneymobile/mocha/NSObject$3;->val$object:Ljava/lang/Object;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeWithOptionalParametersWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-void
.end method
