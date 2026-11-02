.class public Lcom/disneymobile/mocha/NSInvocation;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSInvocation.java"


# instance fields
.field private final arguments:[Ljava/lang/Object;

.field private selector:Lcom/disneymobile/mocha/support/Selector;

.field private final signature:Lcom/disneymobile/mocha/NSMethodSignature;

.field private target:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lcom/disneymobile/mocha/NSMethodSignature;)V
    .locals 1
    .param p1, "signature"    # Lcom/disneymobile/mocha/NSMethodSignature;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/disneymobile/mocha/NSInvocation;->signature:Lcom/disneymobile/mocha/NSMethodSignature;

    .line 23
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSMethodSignature;->numberOfArguments()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    .line 24
    return-void
.end method

.method public static invocationWithMethodSignature(Lcom/disneymobile/mocha/NSMethodSignature;)Lcom/disneymobile/mocha/NSInvocation;
    .locals 1
    .param p0, "signature"    # Lcom/disneymobile/mocha/NSMethodSignature;

    .prologue
    .line 18
    new-instance v0, Lcom/disneymobile/mocha/NSInvocation;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSInvocation;-><init>(Lcom/disneymobile/mocha/NSMethodSignature;)V

    return-object v0
.end method


# virtual methods
.method public argumentAtIndex(I)Ljava/lang/Object;
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 69
    add-int/lit8 p1, p1, -0x2

    .line 71
    if-ltz p1, :cond_0

    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    array-length v1, v1

    if-lt p1, v1, :cond_1

    .line 72
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 73
    .local v0, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "kNSErrorLocalizedFailureReasonErrorKey"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v3, p1, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is an illegal argument number."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v1, "kMochaDomain"

    const/16 v2, -0x3e8

    invoke-static {v1, v2, v0}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 77
    .end local v0    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v1

    :cond_1
    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    aget-object v1, v1, p1

    goto :goto_0
.end method

.method public invokeIfRespondsToSelectorWithError(Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    iget-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->selector:Lcom/disneymobile/mocha/support/Selector;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->target:Ljava/lang/Object;

    iget-object v2, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    invoke-virtual {v0, p1, v1, v2}, Lcom/disneymobile/mocha/support/Selector;->invokeIfRespondsToSelectorWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public invokeWithError(Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    iget-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->selector:Lcom/disneymobile/mocha/support/Selector;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->target:Ljava/lang/Object;

    iget-object v2, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    invoke-virtual {v0, p1, v1, v2}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public methodSignature()Lcom/disneymobile/mocha/NSMethodSignature;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->signature:Lcom/disneymobile/mocha/NSMethodSignature;

    return-object v0
.end method

.method public final selector()Lcom/disneymobile/mocha/support/Selector;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->selector:Lcom/disneymobile/mocha/support/Selector;

    return-object v0
.end method

.method public setArgumentAtIndex(Ljava/lang/Object;I)Lcom/disneymobile/mocha/NSError;
    .locals 5
    .param p1, "argument"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    const/16 v4, -0x3e8

    .line 48
    const/4 v1, 0x2

    if-ge p2, v1, :cond_0

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 50
    .local v0, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v2, "The index is wrong. 0 is self, 1 is _cmd, neither of which we support."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v1, "kMochaDomain"

    invoke-static {v1, v4, v0}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 64
    .end local v0    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v1

    .line 53
    :cond_0
    add-int/lit8 p2, p2, -0x2

    .line 56
    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    array-length v1, v1

    if-lt p2, v1, :cond_1

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 58
    .restart local v0    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "kNSErrorLocalizedFailureReasonErrorKey"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v3, p2, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is an illegal argument number."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v1, "kMochaDomain"

    invoke-static {v1, v4, v0}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    goto :goto_0

    .line 62
    .end local v0    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    iget-object v1, p0, Lcom/disneymobile/mocha/NSInvocation;->arguments:[Ljava/lang/Object;

    aput-object p1, v1, p2

    .line 64
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setSelector(Lcom/disneymobile/mocha/support/Selector;)V
    .locals 0
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/disneymobile/mocha/NSInvocation;->selector:Lcom/disneymobile/mocha/support/Selector;

    .line 40
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/disneymobile/mocha/NSInvocation;->target:Ljava/lang/Object;

    .line 36
    return-void
.end method

.method public target()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/disneymobile/mocha/NSInvocation;->target:Ljava/lang/Object;

    return-object v0
.end method
