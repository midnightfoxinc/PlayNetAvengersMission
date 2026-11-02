.class Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;
.super Ljava/lang/Object;
.source "TKStateMachine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

.field final synthetic val$evt:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    .prologue
    .line 498
    iput-object p1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;->this$0:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    iput-object p2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;->val$evt:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 500
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;->this$0:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;->val$evt:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    iget-object v1, v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;->val$evt:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->userInfo:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 501
    return-void
.end method
