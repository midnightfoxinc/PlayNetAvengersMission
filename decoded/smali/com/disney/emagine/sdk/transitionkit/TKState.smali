.class public Lcom/disney/emagine/sdk/transitionkit/TKState;
.super Ljava/lang/Object;
.source "TKState.java"


# instance fields
.field public didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

.field public didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

.field public name:Ljava/lang/String;

.field public willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

.field public willExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "aDecoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string v0, "name"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public static stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 30
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "name cannot be blank or null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 33
    :cond_1
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKState;-><init>()V

    .line 35
    .local v0, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iput-object p0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    .line 37
    return-object v0
.end method


# virtual methods
.method public copy()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 47
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKState;-><init>()V

    .line 49
    .local v0, "copiedState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    .line 50
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    .line 51
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 52
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;

    .line 53
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    .line 55
    return-object v0
.end method

.method public description()Ljava/lang/String;
    .locals 4

    .prologue
    .line 42
    const-string v0, "<%s:%s \'%s\'>"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "aCoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "name"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    return-void
.end method
