.class Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
.super Ljava/lang/Object;
.source "NSNotificationCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSNotificationCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ObserverRegistration"
.end annotation


# instance fields
.field final object:Ljava/lang/Object;

.field final selector:Lcom/disneymobile/mocha/support/Selector;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "selector"    # Lcom/disneymobile/mocha/support/Selector;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->object:Ljava/lang/Object;

    .line 24
    iput-object p2, p0, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->selector:Lcom/disneymobile/mocha/support/Selector;

    .line 25
    return-void
.end method


# virtual methods
.method public invoke(Lcom/disneymobile/mocha/NSNotification;)V
    .locals 5
    .param p1, "notification"    # Lcom/disneymobile/mocha/NSNotification;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->selector:Lcom/disneymobile/mocha/support/Selector;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->object:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeWithOptionalParametersWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    return-void
.end method
