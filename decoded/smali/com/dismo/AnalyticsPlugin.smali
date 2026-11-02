.class public Lcom/dismo/AnalyticsPlugin;
.super Ljava/lang/Object;
.source "AnalyticsPlugin.java"


# static fields
.field private static final analyticsTag:Ljava/lang/String; = "DMOAnalytics"

.field static instance:Lcom/dismo/AnalyticsPlugin;

.field private static m_context:Landroid/content/Context;


# instance fields
.field private analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-object v0, Lcom/dismo/AnalyticsPlugin;->instance:Lcom/dismo/AnalyticsPlugin;

    .line 18
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    .line 37
    return-void
.end method

.method public static instance()Lcom/dismo/AnalyticsPlugin;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/dismo/AnalyticsPlugin;->instance:Lcom/dismo/AnalyticsPlugin;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/dismo/AnalyticsPlugin;

    invoke-direct {v0}, Lcom/dismo/AnalyticsPlugin;-><init>()V

    sput-object v0, Lcom/dismo/AnalyticsPlugin;->instance:Lcom/dismo/AnalyticsPlugin;

    .line 33
    :cond_0
    sget-object v0, Lcom/dismo/AnalyticsPlugin;->instance:Lcom/dismo/AnalyticsPlugin;

    return-object v0
.end method


# virtual methods
.method public dmoAnalyticsGetAutoBacklogMode()Z
    .locals 2

    .prologue
    .line 182
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->getAutoBacklogMode()Z

    move-result v0

    .line 187
    :goto_0
    return v0

    .line 185
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsGetAutoBacklogMode can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dmoAnalyticsGetCanUseNetwork()Z
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->getCanUseNetwork()Z

    move-result v0

    .line 124
    :goto_0
    return v0

    .line 122
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsGetUseNetwork can\'t function because analytics is null."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dmoAnalyticsGetSysInfo()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 165
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->getSysInfo()Ljava/util/Map;

    move-result-object v0

    .line 169
    :goto_0
    return-object v0

    .line 167
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsGetSysInfo can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dmoAnalyticsIsRestrictedTracking()Z
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v0

    .line 151
    :goto_0
    return v0

    .line 149
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsIsRestrictedTracking can\'t function because analytics is null."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dmoAnalyticsLogAppBackground()V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppBackground()V

    .line 57
    :cond_0
    return-void
.end method

.method public dmoAnalyticsLogAppEnd()V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppEnd()V

    .line 62
    :cond_0
    return-void
.end method

.method public dmoAnalyticsLogAppForeground()V
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppForeground()V

    .line 52
    :cond_0
    return-void
.end method

.method public dmoAnalyticsLogAppStart()V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppStart()V

    .line 47
    :cond_0
    return-void
.end method

.method public dmoAnalyticsLogEvent(Ljava/lang/String;)V
    .locals 1
    .param p1, "newEvent"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAnalyticsEvent(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    .line 42
    :cond_0
    return-void
.end method

.method public dmoAnalyticsLogEventWithContext(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "detailContext"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v2, :cond_0

    .line 68
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "jo":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v2, p1, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAnalyticsEventWithContext(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "DMOAnalytics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dmoAnalyticsLogEventWithContext can\'t parse the JSONObject."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsLogGameAction(Ljava/lang/String;)V
    .locals 5
    .param p1, "detailContext"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v2, :cond_0

    .line 80
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 81
    .local v1, "jo":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v2, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logGameAction(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "DMOAnalytics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dmoAnalyticsLogGameAction can\'t parse the JSONObject."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsLogMoneyAction(Ljava/lang/String;)V
    .locals 5
    .param p1, "detailContext"    # Ljava/lang/String;

    .prologue
    .line 89
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v2, :cond_0

    .line 92
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 93
    .local v1, "jo":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v2, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logMoneyAction(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "DMOAnalytics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "dmoAnalyticsLogMoneyAction can\'t parse the JSONObject."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsSetAutoBacklogMode(Z)V
    .locals 2
    .param p1, "isEnabled"    # Z

    .prologue
    .line 174
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->setAutoBacklogMode(Z)V

    .line 178
    :goto_0
    return-void

    .line 177
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsSetAutoBacklogMode can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsSetCanUseNetwork(Z)V
    .locals 2
    .param p1, "isEnabled"    # Z

    .prologue
    .line 108
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->setCanUseNetwork(Z)V

    .line 112
    :goto_0
    return-void

    .line 111
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsSetCanUseNetwork can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsSetDebugLogging(Z)V
    .locals 2
    .param p1, "isEnabled"    # Z

    .prologue
    .line 101
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->setDebugLogging(Z)V

    .line 105
    :goto_0
    return-void

    .line 104
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsSetDebugLogging can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsSetRestrictedTracking(Z)V
    .locals 2
    .param p1, "isRestricted"    # Z

    .prologue
    .line 156
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->setCanUseNetwork(Z)V

    .line 160
    :goto_0
    return-void

    .line 159
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsSetRestrictedTracking can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsStop()V
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->stop()V

    .line 196
    :goto_0
    return-void

    .line 195
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsStop can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticsflushAnalyticsQueue()V
    .locals 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->flushAnalyticsQueue()V

    .line 132
    :goto_0
    return-void

    .line 131
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticsflushAnalyticsQueue can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public dmoAnalyticspersistAnalyticsQueue()V
    .locals 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalytics;->persistAnalyticsQueue()V

    .line 139
    :goto_0
    return-void

    .line 138
    :cond_0
    const-string v0, "DMOAnalytics"

    const-string v1, "dmoAnalyticspersistAnalyticsQueue can\'t function because analytics is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "appID"    # Ljava/lang/String;
    .param p2, "appKey"    # Ljava/lang/String;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/disneymobile/analytics/DMOAnalytics;

    sget-object v1, Lcom/dismo/AnalyticsPlugin;->m_context:Landroid/content/Context;

    invoke-direct {v0, v1, p1, p2}, Lcom/disneymobile/analytics/DMOAnalytics;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/dismo/AnalyticsPlugin;->analyticsInstance:Lcom/disneymobile/analytics/DMOAnalytics;

    .line 23
    :cond_0
    return-void
.end method

.method public setContext(Landroid/app/Activity;)V
    .locals 1
    .param p1, "ctx"    # Landroid/app/Activity;

    .prologue
    .line 26
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/dismo/AnalyticsPlugin;->m_context:Landroid/content/Context;

    .line 27
    return-void
.end method
