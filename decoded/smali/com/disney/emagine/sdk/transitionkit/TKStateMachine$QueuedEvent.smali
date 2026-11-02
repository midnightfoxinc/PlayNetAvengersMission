.class final Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
.super Ljava/lang/Object;
.source "TKStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueuedEvent"
.end annotation


# instance fields
.field public final eventOrEventName:Ljava/lang/Object;

.field final synthetic this$0:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

.field public final userInfo:Ljava/util/HashMap;
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
.method public constructor <init>(Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 0
    .param p2, "eventOrEventName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 569
    .local p3, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->this$0:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 570
    iput-object p2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    .line 571
    iput-object p3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->userInfo:Ljava/util/HashMap;

    .line 572
    return-void
.end method
