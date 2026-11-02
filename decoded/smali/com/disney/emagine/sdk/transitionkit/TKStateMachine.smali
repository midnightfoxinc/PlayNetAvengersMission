.class public final Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
.super Ljava/lang/Object;
.source "TKStateMachine.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DefaultLocale"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    }
.end annotation


# static fields
.field public static final TKErrorDomain:Ljava/lang/String; = "org.blakewatters.TransitionKit.errors"

.field public static final TKInvalidTransitionError:I = 0x3e8

.field public static final TKStateMachineDidChangeStateEventUserInfoKey:Ljava/lang/String; = "event"

.field public static final TKStateMachineDidChangeStateNewStateUserInfoKey:Ljava/lang/String; = "new"

.field public static final TKStateMachineDidChangeStateNotification:Ljava/lang/String; = "TKStateMachineDidChangeStateNotification"

.field public static final TKStateMachineDidChangeStateOldStateUserInfoKey:Ljava/lang/String; = "old"

.field public static final TKStateMachineIsImmutableException:Ljava/lang/String; = "TKStateMachineIsImmutableException"

.field public static final TKTransitionDeclinedError:I = 0x3e9

.field public static instance:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;


# instance fields
.field public final TAG:Ljava/lang/String;

.field public currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

.field public events:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;"
        }
    .end annotation
.end field

.field public initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

.field private isActive:Z

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private final mEventQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;",
            ">;"
        }
    .end annotation
.end field

.field public mutableEvents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;"
        }
    .end annotation
.end field

.field public mutableStates:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;"
        }
    .end annotation
.end field

.field public states:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->instance:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v0, "TKStateMachine"

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->TAG:Ljava/lang/String;

    .line 43
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 75
    iput-boolean v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 76
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    .line 85
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "TKStateMachine"

    const-string v2, "Creating state machine."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    .line 87
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    .line 89
    iput-boolean v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 3
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
    .local p1, "aDecoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 510
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v0, "TKStateMachine"

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->TAG:Ljava/lang/String;

    .line 43
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 75
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 76
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    .line 511
    const-string v0, "initialState"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 512
    const-string v0, "currentState"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 513
    const-string v0, "states"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    .line 514
    const-string v0, "events"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    .line 515
    const-string v0, "isActive"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 516
    return-void

    :cond_0
    move v0, v1

    .line 515
    goto :goto_0
.end method

.method public static TKQuoteString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 80
    if-eqz p0, :cond_0

    const-string v0, "\'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static eventWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .locals 4
    .param p0, "name"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;)",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "events":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/disney/emagine/sdk/transitionkit/TKEvent;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 132
    .local v0, "nextSvent":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    iget-object v3, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 138
    .end local v0    # "nextSvent":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private fireEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    .locals 18
    .param p1, "eventOrEventName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disney/emagine/sdk/apple/NSError;"
        }
    .end annotation

    .prologue
    .line 397
    .local p2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-nez v13, :cond_0

    .line 399
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->activate()V

    .line 402
    :cond_0
    move-object/from16 v0, p1

    instance-of v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-nez v13, :cond_1

    move-object/from16 v0, p1

    instance-of v13, v0, Ljava/lang/String;

    if-nez v13, :cond_1

    .line 404
    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "Expected a `TKEvent` object or `NSString` object specifying the name of an event, instead got a `%s` (%s)"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 407
    :cond_1
    move-object/from16 v0, p1

    instance-of v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v13, :cond_2

    move-object/from16 v13, p1

    :goto_0
    check-cast v13, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object v3, v13

    check-cast v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 409
    .local v3, "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    if-nez v3, :cond_3

    .line 411
    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "Cannot find an Event named \'%s\'"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    check-cast p1, Ljava/lang/String;

    .end local p1    # "eventOrEventName":Ljava/lang/Object;
    aput-object p1, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 407
    .end local v3    # "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .restart local p1    # "eventOrEventName":Ljava/lang/Object;
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->eventWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v13

    goto :goto_0

    .line 415
    .restart local v3    # "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    :cond_3
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    if-eqz v13, :cond_5

    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 417
    const-string v11, ""

    .line 419
    .local v11, "statesString":Ljava/lang/String;
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 421
    .local v10, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v10, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 422
    goto :goto_1

    .line 424
    .end local v10    # "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_4
    const-string v13, "An attempt was made to fire the \'%s\' event while in the \'%s\' state, but the event can only be fired from the following states: %s"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    iget-object v0, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x2

    aput-object v11, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 426
    .local v2, "errorInfo":Ljava/lang/String;
    new-instance v13, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v14, "org.blakewatters.TransitionKit.errors"

    const/16 v15, 0x3e8

    invoke-direct {v13, v14, v15, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 505
    .end local v2    # "errorInfo":Ljava/lang/String;
    .end local v11    # "statesString":Ljava/lang/String;
    :goto_2
    return-object v13

    .line 429
    :cond_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v3, v13, v0, v1}, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->transitionForEvent(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    move-result-object v12

    .line 431
    .local v12, "transition":Lcom/disney/emagine/sdk/transitionkit/TKTransition;
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->shouldFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;

    if-eqz v13, :cond_6

    .line 433
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->shouldFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;

    invoke-virtual {v13, v3, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKShouldFireEventBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)Ljava/lang/Boolean;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-nez v13, :cond_6

    .line 435
    const-string v13, "An attempt to fire the \'%s\' event was declined because `shouldFireEventBlock` returned `NO`."

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    iget-object v0, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 437
    .restart local v2    # "errorInfo":Ljava/lang/String;
    new-instance v13, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v14, "org.blakewatters.TransitionKit.errors"

    const/16 v15, 0x3e9

    invoke-direct {v13, v14, v15, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_2

    .line 441
    .end local v2    # "errorInfo":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 442
    .local v9, "oldState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v7, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 444
    .local v7, "newState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->willFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;

    if-eqz v13, :cond_7

    .line 446
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->willFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;

    invoke-virtual {v13, v3, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKWillFireEventBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 449
    :cond_7
    iget-object v13, v9, Lcom/disney/emagine/sdk/transitionkit/TKState;->willExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;

    if-eqz v13, :cond_8

    .line 451
    iget-object v13, v9, Lcom/disney/emagine/sdk/transitionkit/TKState;->willExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;

    invoke-virtual {v13, v9, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKWillExitStateBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 454
    :cond_8
    iget-object v13, v7, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    if-eqz v13, :cond_9

    .line 456
    iget-object v13, v7, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    invoke-virtual {v13, v7, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 459
    :cond_9
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 460
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v14, "TKStateMachine"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "fireEvent: current state is now "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    iget-object v13, v9, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    if-eqz v13, :cond_a

    .line 464
    iget-object v13, v9, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    invoke-interface {v13, v9, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 467
    :cond_a
    iget-object v13, v7, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    if-eqz v13, :cond_b

    .line 469
    iget-object v13, v7, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    invoke-interface {v13, v7, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 472
    :cond_b
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->didFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;

    if-eqz v13, :cond_c

    .line 474
    iget-object v13, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->didFireEventBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;

    invoke-virtual {v13, v3, v12}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidFireEventBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKEvent;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 477
    :cond_c
    if-eqz p2, :cond_e

    invoke-virtual/range {p2 .. p2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v13

    :goto_3
    check-cast v13, Ljava/util/HashMap;

    move-object v8, v13

    check-cast v8, Ljava/util/HashMap;

    .line 479
    .local v8, "notificationInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "old"

    invoke-virtual {v8, v13, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    const-string v13, "new"

    invoke-virtual {v8, v13, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    const-string v13, "event"

    invoke-virtual {v8, v13, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    new-instance v6, Landroid/content/Intent;

    const-string v13, "TKStateMachineDidChangeStateNotification"

    invoke-direct {v6, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 484
    .local v6, "intent":Landroid/content/Intent;
    const-string v13, "userInfo"

    invoke-virtual {v6, v13, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 486
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v13

    invoke-static {v13}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 489
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v13, v13, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v14, "Ready"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 490
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    invoke-virtual {v13}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    .line 491
    .local v4, "evt":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    if-eqz v4, :cond_d

    .line 493
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v15, "TKStateMachine"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "fireEvent: dequed event "

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    iget-object v13, v4, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    instance-of v13, v13, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v13, :cond_f

    iget-object v13, v4, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    check-cast v13, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    iget-object v13, v13, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    .line 494
    :goto_4
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v16, " ("

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    move-object/from16 v16, v0

    .line 495
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->size()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v16, " left)"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 493
    invoke-virtual {v14, v15, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v13

    invoke-virtual {v13}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v5

    .line 498
    .local v5, "handler":Landroid/os/Handler;
    new-instance v13, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$1;-><init>(Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;)V

    invoke-virtual {v5, v13}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 505
    .end local v4    # "evt":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    .end local v5    # "handler":Landroid/os/Handler;
    :cond_d
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 477
    .end local v6    # "intent":Landroid/content/Intent;
    .end local v8    # "notificationInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_e
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    goto/16 :goto_3

    .line 493
    .restart local v4    # "evt":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    .restart local v6    # "intent":Landroid/content/Intent;
    .restart local v8    # "notificationInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_f
    iget-object v13, v4, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    .line 494
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_4
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->instance:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->instance:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    .line 99
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->instance:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    return-object v0
.end method

.method public static stateWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKState;
    .locals 4
    .param p0, "name"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;)",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "states":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 119
    .local v0, "nextState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v3, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 125
    .end local v0    # "nextState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public activate()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 265
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-ne v0, v1, :cond_1

    .line 284
    :cond_0
    :goto_0
    return-void

    .line 270
    :cond_1
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 273
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    if-eqz v0, :cond_2

    .line 275
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->willEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/block/TKWillEnterStateBlock;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 278
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 280
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-interface {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;->run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    goto :goto_0
.end method

.method public addEvent(Lcom/disney/emagine/sdk/transitionkit/TKEvent;)V
    .locals 7
    .param p1, "event"    # Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .prologue
    const/4 v3, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 221
    iget-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-ne v1, v5, :cond_0

    .line 248
    :goto_0
    return-void

    .line 226
    :cond_0
    if-nez p1, :cond_1

    .line 228
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add a `null` event to the state machine."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 231
    :cond_1
    iget-object v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    if-eqz v1, :cond_3

    .line 233
    iget-object v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 235
    .local v0, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 237
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add event \'%s\' to the state machine: the event references a state \'%s\', which has not been added to the state machine."

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    aput-object v4, v3, v6

    iget-object v4, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 242
    .end local v0    # "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_3
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 244
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add event \'%s\' to the state machine: the event references a state \'%s\', which has not been added to the state machine."

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    aput-object v4, v3, v6

    iget-object v4, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v4, v4, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 247
    :cond_4
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addEvents(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 252
    .local p1, "arrayOfEvents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKEvent;>;"
    iget-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-eqz v1, :cond_1

    .line 261
    :cond_0
    return-void

    .line 257
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 259
    .local v0, "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addEvent(Lcom/disney/emagine/sdk/transitionkit/TKEvent;)V

    goto :goto_0
.end method

.method public addState(Lcom/disney/emagine/sdk/transitionkit/TKState;)V
    .locals 6
    .param p1, "state"    # Lcom/disney/emagine/sdk/transitionkit/TKState;

    .prologue
    const/4 v5, 0x1

    .line 165
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-ne v0, v5, :cond_0

    .line 181
    :goto_0
    return-void

    .line 170
    :cond_0
    instance-of v0, p1, Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v0, :cond_1

    .line 172
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expected a `TKState` object or `NSString` object specifying the name of a state, instead got a `%s` (%s)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v0, :cond_2

    .line 177
    iput-object p1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 180
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public addStates(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "arrayOfStates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    iget-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 194
    :cond_0
    return-void

    .line 190
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 192
    .local v0, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addState(Lcom/disney/emagine/sdk/transitionkit/TKState;)V

    goto :goto_0
.end method

.method public addStatesAndEvents(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "states":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    .local p2, "events":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKEvent;>;"
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addStates(Ljava/util/ArrayList;)V

    .line 144
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addEvents(Ljava/util/ArrayList;)V

    .line 145
    return-void
.end method

.method public canFireEvent(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "eventOrEventName"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 288
    instance-of v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-nez v1, :cond_0

    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_0

    .line 290
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Expected a `TKEvent` object or `NSString` object specifying the name of an event, instead got a `%s` (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_0
    instance-of v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v1, :cond_1

    move-object v1, p1

    :goto_0
    check-cast v1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object v0, v1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 295
    .local v0, "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    if-nez v0, :cond_2

    .line 297
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot find an Event named \'%s\'"

    new-array v3, v6, [Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .end local p1    # "eventOrEventName":Ljava/lang/Object;
    aput-object p1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    .end local v0    # "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .restart local p1    # "eventOrEventName":Ljava/lang/Object;
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    invoke-static {p1, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->eventWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v1

    goto :goto_0

    .line 300
    .restart local v0    # "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    :cond_2
    iget-object v1, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public copy()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    .locals 11

    .prologue
    .line 529
    new-instance v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;-><init>()V

    .line 531
    .local v1, "copiedStateMachine":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    const/4 v7, 0x0

    iput-boolean v7, v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    .line 532
    const/4 v7, 0x0

    iput-object v7, v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 533
    iget-object v7, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iput-object v7, v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 535
    iget-object v7, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->states:Ljava/util/HashSet;

    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 537
    .local v6, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    invoke-virtual {v6}, Lcom/disney/emagine/sdk/transitionkit/TKState;->copy()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v1, v7}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addState(Lcom/disney/emagine/sdk/transitionkit/TKState;)V

    goto :goto_0

    .line 540
    .end local v6    # "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_0
    iget-object v7, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->events:Ljava/util/HashSet;

    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .line 542
    .local v3, "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 544
    .local v5, "sourceStates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    iget-object v8, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->sourceStates:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 546
    .local v4, "sourceState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v9, v4, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    iget-object v10, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-static {v9, v10}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->stateWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 549
    .end local v4    # "sourceState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_1
    iget-object v8, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->destinationState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v8, v8, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    iget-object v9, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-static {v8, v9}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->stateWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v2

    .line 550
    .local v2, "destinationState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    iget-object v8, v3, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    invoke-static {v8, v5, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v0

    .line 552
    .local v0, "copiedEvent":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addEvent(Lcom/disney/emagine/sdk/transitionkit/TKEvent;)V

    goto :goto_1

    .line 555
    .end local v0    # "copiedEvent":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .end local v2    # "destinationState":Lcom/disney/emagine/sdk/transitionkit/TKState;
    .end local v3    # "event":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    .end local v5    # "sourceStates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/transitionkit/TKState;>;"
    :cond_2
    return-object v1
.end method

.method public description()Ljava/lang/String;
    .locals 4

    .prologue
    .line 560
    const-string v1, "<%s:%s %d States, %d Events. currentState=%s, initialState=\'%s\', isActive=%s>"

    const/4 v0, 0x7

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 561
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x2

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x3

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x4

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v3, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    .line 562
    invoke-static {v3}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->TKQuoteString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x5

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v3, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    aput-object v3, v2, v0

    const/4 v3, 0x6

    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    if-eqz v0, :cond_0

    const-string v0, "YES"

    :goto_0
    aput-object v0, v2, v3

    .line 560
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 562
    :cond_0
    const-string v0, "NO"

    goto :goto_0
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
    .line 520
    .local p1, "aCoder":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "initialState"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    const-string v0, "currentState"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    const-string v0, "states"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->states:Ljava/util/HashSet;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    const-string v0, "events"

    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->events:Ljava/util/HashSet;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    const-string v0, "isActive"

    iget-boolean v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    return-void
.end method

.method public events()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableEvents:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    return-object v0
.end method

.method public fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    .locals 4
    .param p1, "eventOrEventName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disney/emagine/sdk/apple/NSError;"
        }
    .end annotation

    .prologue
    .line 385
    .local p2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v2, "TKStateMachine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fireEventUnconditionally (state="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "): firing unconditionally "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    instance-of v0, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    .line 389
    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 385
    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v0

    return-object v0

    .line 385
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v0, v0, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    goto :goto_0

    .line 389
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public fireOnlyIfReady(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    .locals 6
    .param p1, "eventOrEventName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disney/emagine/sdk/apple/NSError;"
        }
    .end annotation

    .prologue
    .line 310
    .local p2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "fireOnlyIfReady (state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v2, :cond_0

    const-string v2, "null"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    const-string v2, "):"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    :try_start_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v3, "Ready"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 317
    const-string v2, "firing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    instance-of v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v2, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object v2, v0

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 328
    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .end local p1    # "eventOrEventName":Ljava/lang/Object;
    :goto_2
    return-object v2

    .line 312
    .restart local p1    # "eventOrEventName":Ljava/lang/Object;
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    goto :goto_0

    .line 319
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 322
    :cond_2
    const-string v2, "ignoring "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    instance-of v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    .end local p1    # "eventOrEventName":Ljava/lang/Object;
    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    const-string v2, " (not in ready state)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 328
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v3, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    const/4 v2, 0x0

    goto :goto_2

    .line 324
    .restart local p1    # "eventOrEventName":Ljava/lang/Object;
    :cond_3
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_3

    .line 328
    .end local p1    # "eventOrEventName":Ljava/lang/Object;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    throw v2
.end method

.method public fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    .locals 6
    .param p1, "eventOrEventName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disney/emagine/sdk/apple/NSError;"
        }
    .end annotation

    .prologue
    .line 344
    .local p2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 345
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "fireOrQueueEvent (state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v2, :cond_0

    const-string v2, "null"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    const-string v2, "):"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    :try_start_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v3, "Ready"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 350
    const-string v2, "firing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    instance-of v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v2, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object v2, v0

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 362
    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    :goto_2
    return-object v2

    .line 346
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    goto :goto_0

    .line 352
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 355
    :cond_2
    const-string v2, "queing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    instance-of v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    if-eqz v2, :cond_3

    move-object v0, p1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object v2, v0

    iget-object v2, v2, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->name:Ljava/lang/String;

    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    const-string v2, " (not in ready state)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    new-instance v3, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    invoke-direct {v3, p0, p1, p2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;-><init>(Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;Ljava/lang/Object;Ljava/util/HashMap;)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 362
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v3, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    const/4 v2, 0x0

    goto :goto_2

    .line 357
    :cond_3
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_3

    .line 362
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "TKStateMachine"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    throw v2
.end method

.method public invalidateEventQueue()V
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 371
    return-void
.end method

.method public isActive()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    return v0
.end method

.method public isInState(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "stateOrStateName"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 198
    instance-of v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-nez v1, :cond_0

    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_0

    .line 200
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Expected a `TKState` object or `NSString` object specifying the name of a state, instead got a `%s` (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_0
    instance-of v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-eqz v1, :cond_1

    move-object v1, p1

    :goto_0
    check-cast v1, Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object v0, v1

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 205
    .local v0, "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    if-nez v0, :cond_2

    .line 207
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot find a State named \'%s\'"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    .end local v0    # "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-static {p1, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->stateWithName(Ljava/lang/Object;Ljava/util/HashSet;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v1

    goto :goto_0

    .line 210
    .restart local v0    # "state":Lcom/disney/emagine/sdk/transitionkit/TKState;
    :cond_2
    iget-object v1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public raiseIfActive()V
    .locals 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 111
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to modify state machine: The state machine has already been activated."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_0
    return-void
.end method

.method public removeQueuedEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 374
    iget-object v2, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mEventQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 375
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 376
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;

    .line 377
    .local v0, "event":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    iget-object v2, v0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;->eventOrEventName:Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 378
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 381
    .end local v0    # "event":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine$QueuedEvent;
    :cond_1
    return-void
.end method

.method public setInitialState(Lcom/disney/emagine/sdk/transitionkit/TKState;)V
    .locals 2
    .param p1, "state"    # Lcom/disney/emagine/sdk/transitionkit/TKState;

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isActive:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 155
    :goto_0
    return-void

    .line 154
    :cond_0
    iput-object p1, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    goto :goto_0
.end method

.method public states()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Lcom/disney/emagine/sdk/transitionkit/TKState;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->mutableStates:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    return-object v0
.end method
