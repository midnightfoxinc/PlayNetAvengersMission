.class public Lcom/disneymobile/mocha/support/Out;
.super Ljava/lang/Object;
.source "Out.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private hasValue:Z

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    .local p0, "this":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disneymobile/mocha/support/Out;->hasValue:Z

    .line 6
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/mocha/support/Out;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<TT;>;"
    iget-boolean v0, p0, Lcom/disneymobile/mocha/support/Out;->hasValue:Z

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This out parameter was never assigned a value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/mocha/support/Out;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hasValue()Z
    .locals 1

    .prologue
    .line 9
    .local p0, "this":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<TT;>;"
    iget-boolean v0, p0, Lcom/disneymobile/mocha/support/Out;->hasValue:Z

    return v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lcom/disneymobile/mocha/support/Out;->hasValue:Z

    if-eqz v0, :cond_0

    .line 20
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This out parameter was already assigned a value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/mocha/support/Out;->hasValue:Z

    .line 22
    iput-object p1, p0, Lcom/disneymobile/mocha/support/Out;->value:Ljava/lang/Object;

    .line 23
    return-void
.end method
