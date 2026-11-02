.class public Lcom/disney/emagine/sdk/transitionkit/TKEvent;
.super Ljava/lang/Object;
.source "TKEvent.java"


# instance fields
.field public destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

.field public didFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;

.field public name:Ljava/lang/String;

.field public shouldFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;

.field public sourceStates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;"
        }
    .end annotation
.end field

.field public willFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
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
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "aDecoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const-string v0, "name"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    .line 85
    const-string v0, "sourceStates"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    .line 86
    const-string v0, "destinationState"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 87
    return-void
.end method

.method static TKDescribeSourceStates(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "states":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 31
    const-string v0, "any state"

    .line 48
    :cond_0
    return-object v0

    .line 34
    :cond_1
    const-string v0, ""

    .line 35
    .local v0, "description":Ljava/lang/String;
    const-string v2, ""

    .line 36
    .local v2, "separator":Ljava/lang/String;
    const/4 v1, -0x1

    .line 38
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 40
    .local v3, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v1, v5, :cond_2

    .line 42
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    if-ne v1, v5, :cond_3

    const-string v2, " and "

    .line 45
    :cond_2
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'%s\'%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    goto :goto_0

    .line 42
    :cond_3
    const-string v2, ", "

    goto :goto_1
.end method

.method public static eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p2, "destinationState"    # Lcom/disney/emagine/sdk/transitionkit/TKState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ")",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "sourceStates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 58
    :cond_0
    if-nez p2, :cond_1

    .line 63
    :cond_1
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;-><init>()V

    .line 65
    .local v0, "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    iput-object p0, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    .line 66
    iput-object p1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    .line 67
    iput-object p2, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 69
    return-object v0
.end method


# virtual methods
.method public copy()Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;-><init>()V

    .line 100
    .local v0, "copiedEvent":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    .line 101
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    .line 102
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 103
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->shouldFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->shouldFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;

    .line 104
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->willFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->willFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;

    .line 105
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->didFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;

    iput-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->didFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;

    .line 107
    return-object v0
.end method

.method public description()Ljava/lang/String;
    .locals 4

    .prologue
    .line 74
    const-string v0, "<%s:%s \'%s\' transitions from %s to \'%s\'>"

    const/4 v1, 0x5

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

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->TKDescribeSourceStates(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v3, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

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
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "aCoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "name"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v0, "sourceStates"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v0, "destinationState"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    return-void
.end method
