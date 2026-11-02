.class public Lcom/disney/emagine/sdk/transitionkit/TKTransition;
.super Ljava/lang/Object;
.source "TKTransition.java"


# instance fields
.field public event:Lcom/disney/emagine/sdk/transitionkit/TKEvent;

.field public sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

.field public stateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

.field public userInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static transitionForEvent(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/transitionkit/TKTransition;
    .locals 1
    .param p0, "event"    # Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .param p1, "sourceState"    # Lcom/disney/emagine/sdk/transitionkit/TKState;
    .param p2, "stateMachine"    # Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            "Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disney/emagine/sdk/transitionkit/TKTransition;"
        }
    .end annotation

    .prologue
    .line 22
    .local p3, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKTransition;-><init>()V

    .line 24
    .local v0, "transition":Lcom/disney/emagine/sdk/transitionkit/TKTransition;
    iput-object p0, v0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->event:Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 25
    iput-object p1, v0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 26
    iput-object p2, v0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->stateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    .line 27
    iput-object p3, v0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    .line 29
    return-object v0
.end method


# virtual methods
.method public destinationState()Lcom/disney/emagine/sdk/transitionkit/TKState;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->event:Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    return-object v0
.end method
