.class public Lcom/disney/id/android/DIDProfile;
.super Ljava/lang/Object;
.source "DIDProfile.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDProfileConst;


# instance fields
.field private final profile:Lorg/json/JSONObject;


# direct methods
.method protected constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    .line 14
    return-void
.end method


# virtual methods
.method public getAgeBand()Ljava/lang/String;
    .locals 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "ageBand"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAgeBandAssumed()Z
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "ageBandAssumed"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getBoolean(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getComplete()Z
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "complete"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getBoolean(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getCountryCodeDetected()Ljava/lang/String;
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "countryCodeDetected"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDateOfBirth()Ljava/lang/String;
    .locals 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "dateOfBirth"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 2

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "email"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmailVerified()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "emailVerified"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "firstName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGender()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "gender"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLanguagePreference()Ljava/lang/String;
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "languagePreference"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "lastName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLinkedAccountsAvailable()Z
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "linkedAccountsAvailable"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getBoolean(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getMiddleName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "middleName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParentEmail()Ljava/lang/String;
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "parentEmail"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParentEmailVerified()Ljava/lang/String;
    .locals 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "parentEmailVerified"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "prefix"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPronunciationName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "pronunciationName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReferenceId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "referenceId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "region"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRegistrationDate()J
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "registrationDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSWID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "swid"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "suffix"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 2

    .prologue
    .line 20
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "username"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasAgeBand()Z
    .locals 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "ageBand"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasAgeBandAssumed()Z
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "ageBandAssumed"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "complete"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasCountryCodeDetected()Z
    .locals 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "countryCodeDetected"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasDateOfBirth()Z
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "dateOfBirth"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasEmail()Z
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "email"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasEmailVerified()Z
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "emailVerified"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasFirstName()Z
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "firstName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasGender()Z
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "gender"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasLanguagePreference()Z
    .locals 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "languagePreference"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasLastName()Z
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "lastName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasLinkedAccountsAvailable()Z
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "linkedAccountsAvailable"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasMiddleName()Z
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "middleName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasParentEmail()Z
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "parentEmail"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasParentEmailVerified()Z
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "parentEmailVerified"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasPrefix()Z
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "prefix"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasPronunciationName()Z
    .locals 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "pronunciationName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasReferenceId()Z
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "referenceId"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasRegion()Z
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "region"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasRegistrationDate()Z
    .locals 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "registrationDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasSWID()Z
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "swid"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasSuffix()Z
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "suffix"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasUsername()Z
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/disney/id/android/DIDProfile;->profile:Lorg/json/JSONObject;

    const-string v1, "username"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
