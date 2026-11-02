.class public Lcom/disneymobile/mocha/NSNotificationCenter;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSNotificationCenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
    }
.end annotation


# static fields
.field private static defaultCenter:Lcom/disneymobile/mocha/NSNotificationCenter;


# instance fields
.field private final observersByNotificationName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Lcom/disneymobile/mocha/NSNotificationCenter;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSNotificationCenter;-><init>()V

    sput-object v0, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter:Lcom/disneymobile/mocha/NSNotificationCenter;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    .line 17
    return-void
.end method

.method public static defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter:Lcom/disneymobile/mocha/NSNotificationCenter;

    return-object v0
.end method


# virtual methods
.method public addObserverSelectorNameAndObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "observer"    # Ljava/lang/Object;
    .param p2, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p3, "notification"    # Ljava/lang/String;
    .param p4, "object"    # Ljava/lang/Object;

    .prologue
    .line 37
    if-eqz p4, :cond_0

    .line 38
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "NSNotificationCenter.addObserverSelectorNameAndObject - Registering for object-based notifications is not implemented."

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 41
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    invoke-interface {v1, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 42
    iget-object v1, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 47
    .local v0, "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    :goto_0
    new-instance v1, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;

    invoke-direct {v1, p1, p2}, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;-><init>(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void

    .line 44
    .end local v0    # "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .restart local v0    # "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    iget-object v1, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    invoke-interface {v1, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public postNotification(Lcom/disneymobile/mocha/NSNotification;)V
    .locals 5
    .param p1, "notification"    # Lcom/disneymobile/mocha/NSNotification;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 52
    iget-object v3, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSNotification;->name()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 53
    .local v2, "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    if-eqz v2, :cond_0

    .line 54
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;

    .line 55
    .local v1, "observer":Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
    invoke-virtual {v1, p1}, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->invoke(Lcom/disneymobile/mocha/NSNotification;)V

    goto :goto_0

    .line 56
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "observer":Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
    :cond_0
    return-void
.end method

.method public postNotificationNameAndObject(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotificationNameObjectAndUserInfo(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V

    .line 60
    return-void
.end method

.method public postNotificationNameObjectAndUserInfo(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p3, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1, p2, p3}, Lcom/disneymobile/mocha/NSNotification;->notificationWithNameObjectAndUserInfo(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disneymobile/mocha/NSNotification;

    move-result-object v0

    .line 64
    .local v0, "notification":Lcom/disneymobile/mocha/NSNotification;
    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotification(Lcom/disneymobile/mocha/NSNotification;)V

    .line 65
    return-void
.end method

.method public removeObserver(Ljava/lang/Object;)V
    .locals 6
    .param p1, "observer"    # Ljava/lang/Object;

    .prologue
    .line 68
    iget-object v5, p0, Lcom/disneymobile/mocha/NSNotificationCenter;->observersByNotificationName:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 69
    .local v3, "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v0, "deadRegistrations":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;

    .line 72
    .local v4, "registration":Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
    iget-object v5, v4, Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;->object:Ljava/lang/Object;

    if-ne v5, p1, :cond_0

    .line 73
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 77
    .end local v4    # "registration":Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;
    :cond_1
    invoke-interface {v3, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 79
    .end local v0    # "deadRegistrations":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "observers":Ljava/util/List;, "Ljava/util/List<Lcom/disneymobile/mocha/NSNotificationCenter$ObserverRegistration;>;"
    :cond_2
    return-void
.end method
